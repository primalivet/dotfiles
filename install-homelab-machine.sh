#!/usr/bin/env bash

# Exit on error
# This means if any command fails, the script will stop immediately
set -e

# Get system name from first argument
# This is what tells us which machine we're installing (like homelab1, homelab2)
SYSTEM_NAME=$1
if [ -z "$SYSTEM_NAME" ]; then
    echo "Usage: $0 <system-name>"
    echo "Example: $0 homelab1"
    exit 1
fi

# Get disk device from second argument, or auto-detect
# We need to know which disk to install on (like /dev/sda, /dev/vda)
DISK=$2
if [ -z "$DISK" ]; then
    # Try to find the disk automatically by checking common locations
    if [ -e "/dev/vda" ]; then
        # Virtual machines often use vda
        DISK="/dev/vda"
    elif [ -e "/dev/sda" ]; then
        # Most physical machines use sda
        DISK="/dev/sda"
    elif [ -e "/dev/nvme0n1" ]; then
        # Modern SSDs use nvme
        DISK="/dev/nvme0n1"
    else
        echo "Error: Could not detect disk device"
        echo "Please specify disk as second argument"
        echo "Example: $0 homelab1 /dev/sda"
        exit 1
    fi
fi

echo "Installing $SYSTEM_NAME to $DISK"
echo
# Show current disk layout to user before we modify anything
lsblk
echo
# Ask user to confirm they're okay with erasing the disk
read -p "This will ERASE all data on $DISK. Continue? (y/N): " response
case "$response" in
    [yY]) ;;
    *) echo "Installation cancelled"; exit 1 ;;
esac

# Cleanup and unmount everything
echo "[1/7] Cleaning up any previous installation..."
# Turn off swap first (important: do this before unmounting)
set +e  # Don't exit on errors during cleanup
find /proc/swaps -name "*" -type f | grep -v proc | cut -d' ' -f1 | xargs -r swapoff
# Unmount everything mounted under /mnt if it exists
if mountpoint -q /mnt; then
    umount -R /mnt
fi
# Wipe filesystem signatures to ensure clean slate
wipefs -a $DISK
set -e  # Resume exiting on errors

# Partition disk
echo "[2/7] Partitioning disk..."
# Create a new GPT (modern partition table format)
parted $DISK -- mklabel gpt
# Create root partition (where Linux lives) from 512MB to 8GB before end
parted $DISK -- mkpart root ext4 512MB -8GB
# Create swap partition (virtual memory) in the last 8GB
parted $DISK -- mkpart swap linux-swap -8GB 100%
# Create boot partition (where bootloader lives) in first 512MB
parted $DISK -- mkpart ESP fat32 1MB 512MB
# Mark the boot partition as bootable
parted $DISK -- set 3 esp on

# Wait for kernel to recognize new partitions
echo "[3/7] Waiting for partitions to be ready..."
sleep 2
partprobe $DISK

# Format partitions
echo "[4/7] Formatting partitions..."
# NVMe drives use different naming (p1, p2) vs regular drives (1, 2)
if [[ $DISK == *"nvme"* ]]; then
    # Create ext4 filesystem on root partition with label "nixos"
    mkfs.ext4 -F -L nixos ${DISK}p1
    # Create swap space with label "swap"
    mkswap -L swap ${DISK}p2
    # Create FAT32 filesystem on boot partition with label "boot"
    mkfs.fat -F 32 -n boot ${DISK}p3
else
    # Same as above but for non-NVMe drives
    mkfs.ext4 -F -L nixos ${DISK}1
    mkswap -L swap ${DISK}2
    mkfs.fat -F 32 -n boot ${DISK}3
fi

# Mount partitions
echo "[5/7] Mounting partitions..."
# Mount the root filesystem to /mnt (where we'll install NixOS)
mount /dev/disk/by-label/nixos /mnt
# Create boot directory
mkdir -p /mnt/boot
# Mount boot partition with specific permissions (umask=077 makes it only accessible by root)
mount -o umask=077 /dev/disk/by-label/boot /mnt/boot
# Enable the swap partition
swapon /dev/disk/by-label/swap

# Install NixOS from flake
echo "[6/7] Installing NixOS..."
# Install NixOS with:
# - --no-root-passwd: don't ask for root password (user will be created with sudo access)
# - --root /mnt: install to /mnt (our mounted filesystems)
# - --flake: use our github configuration for the specified system
nixos-install --no-root-passwd --root /mnt --flake github:primalivet/dotfiles#$SYSTEM_NAME

# Cleanup
echo "[7/7] Cleaning up..."
# Unmount everything in reverse order
umount /mnt/boot
umount /mnt
# Turn off swap
swapoff /dev/disk/by-label/swap

echo
echo "Installation complete!"
echo "You can now reboot."

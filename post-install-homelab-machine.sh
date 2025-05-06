#!/usr/bin/env bash

# Exit on error
set -e

# Variables with default values
MACHINE_NAME=${1}
MACHINE_IP=${2}
GIT_EMAIL=${3:-"gustafholm1@gmail.com"}
GIT_NAME=${4:-"Gustaf Holm"}
SSH_KEY_PATH=${5:-"$HOME/.ssh/id_ed25519"}
REPO_URL=${6:-"git@github.com:primalivet/dotfiles.git"}

# Check required arguments
if [ -z "$MACHINE_NAME" ] || [ -z "$MACHINE_IP" ]; then
    echo "Error: Both MACHINE_NAME and MACHINE_IP are required"
    echo "Usage: $0 <machine-name> <machine-ip> [git-email] [git-name] [ssh-key-path] [repo-url]"
    echo "Example: $0 homelab1 192.168.1.10 your.email@example.com 'Your Name'"
    exit 1
fi

echo "Automating post-install setup for $MACHINE_NAME at $MACHINE_IP"
echo "Using Git email: $GIT_EMAIL"
echo "Using Git name: $GIT_NAME"
echo "Using SSH key: $SSH_KEY_PATH"
echo "Using repository: $REPO_URL"
echo

# Extract the domain from repo URL
REPO_DOMAIN=$(echo $REPO_URL | grep -o '@.*:' | sed 's/@//g' | sed 's/://g')

# Step 1: Create SSH directory on remote machine if it doesn't exist
echo "[1/7] Setting up SSH directory..."
ssh -o "StrictHostKeyChecking=no" gustaf@$MACHINE_IP "mkdir -p ~/.ssh && chmod 700 ~/.ssh"

# Step 2: Copy SSH keys to the new machine
echo "[2/7] Copying SSH keys..."
scp -o "StrictHostKeyChecking=no" $SSH_KEY_PATH gustaf@$MACHINE_IP:~/.ssh/id_ed25519
scp -o "StrictHostKeyChecking=no" $SSH_KEY_PATH.pub gustaf@$MACHINE_IP:~/.ssh/id_ed25519.pub
ssh gustaf@$MACHINE_IP "chmod 600 ~/.ssh/id_ed25519 && chmod 644 ~/.ssh/id_ed25519.pub"

# Step 3: Add Git host to known_hosts to avoid interactive prompt
echo "[3/7] Adding Git host to known_hosts..."
ssh gustaf@$MACHINE_IP "ssh-keyscan -t rsa $REPO_DOMAIN >> ~/.ssh/known_hosts"

# Step 4: Set up Git configuration
echo "[4/7] Setting up Git configuration..."
ssh gustaf@$MACHINE_IP "git config --global user.email '$GIT_EMAIL' && git config --global user.name '$GIT_NAME'"

# Step 5: Clone the dotfiles repository
echo "[5/7] Cloning dotfiles repository..."
ssh gustaf@$MACHINE_IP "rm -rf ~/dotfiles && git clone $REPO_URL ~/dotfiles"

# Step 6: Copy the hardware configuration
echo "[6/7] Copying hardware configuration to repository..."
# Modified to use -t to allocate a pseudo-terminal for sudo password prompt
ssh -t gustaf@$MACHINE_IP "mkdir -p ~/dotfiles/machines/$MACHINE_NAME && sudo cp /etc/nixos/hardware-configuration.nix ~/dotfiles/machines/$MACHINE_NAME/ && sudo chown gustaf:users ~/dotfiles/machines/$MACHINE_NAME/hardware-configuration.nix"

# Step 7: Commit and push changes
echo "[7/7] Committing and pushing changes..."
ssh gustaf@$MACHINE_IP "cd ~/dotfiles && git add machines/$MACHINE_NAME/hardware-configuration.nix && git commit -m 'update $MACHINE_NAME hardware configuration' && git push origin main"

echo
echo "Post-installation setup complete!"
echo "The hardware configuration for $MACHINE_NAME has been added to your dotfiles repository."

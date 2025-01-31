# dotfiles

I try to keep this as simple as possible. Use `git clone` to get it on your
computer. What directory you clone it to doesn't matter.

```
$ git clone git@github.com:primalivet/dotfiles.git
```

## Nix

After cloning the repository you need to install Nix and Homebrew (Nix requires Homebrew to be installed separately but will manage the packages installed by Homebrew). To install Nix and Nix Darwin follow the `flake.nix` track in the [nix-darwin](https://github.com/LnL7/nix-darwin) project `README.md`.

When installed make sure you replace the hostname in the `flake.nix` in this repository and then run `darwin-rebuilt --flake .`, also while in the root of this repository.

## Symlink configurations

After that you'll need to have GNU Stow installed. It's an application that
manages symlinks.

When the flake is rebuilt and a new Nix __switch__ is active you should have the `stow` (GNU Stow) program installed, among others. We'll use this `stow` program to symlink each applications configuration files. This is required as I don't use Home Manager in this repository (yet).

So with the example commands below you'll end up with symlinks from your `$HOME` directory into this repository, while also keeping directory structure (important).

```
# switch <dir> for the directory of the program configs your want to install
$ stow --no-folding <dir> -t ~

# this is how you would install the config for neovim for example.
$ stow --no-folding nvim -t ~
```

## A note on `--no-folding`

The `--no-folding` option traverses the source directory and symlinks each file
to the coresponding location in the destination/target (`-t`) directory. It'll
create directories needed to match the exact directory structure of the source.

Without the `--no-folding` option only the files and folder directly inside
the "stowed dir" will be symlinked, on level only. _This is generally not the
wanted behaviour for dotfiles_.

If you clone the dotfiles to `~/dotfiles` you don't need the `-t <target>` flag
when using GNU Stow. It will default to the parent directory of your current
working directory.

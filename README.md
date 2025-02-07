# dotfiles

I try to keep this as simple as possible. Use `git clone` to get it on your
computer. What directory you clone it to doesn't matter.

```
$ git clone git@github.com:primalivet/dotfiles.git
```

## Nix

After cloning the repository you need to install Nix and Homebrew (Nix requires Homebrew to be installed separately but will manage the packages installed by Homebrew). To install Nix and Nix Darwin follow the `flake.nix` track in the [nix-darwin](https://github.com/LnL7/nix-darwin) project `README.md`.

When installed make sure you replace the hostname and the username in the `flake.nix` in this repository and then run `darwin-rebuild switch --flake .#[THE HOST NAME YOU PROVIDED]`, while in the root of this repository.

## Symlink configurations

After making a new "generation" with nix (that what we call the output of a "switch") you'll have a program called GNU Stow (`stow`) on you system, it is a good program to handle symbolic links.

So to apply all the configuration for programs like zsh, git, neovim etc you can create symlinks in your `$HOME` directory to this repository, __note__ that you should change the name or `users/gustaf` to `users/yourname`. Then run `stow users --no-folding --target ~`.

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

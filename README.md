# dotfiles

I try to keep this as simple as possible. Use `git clone` to get it on your computer. What directory you clone it to doesn't matter.

```
$ git clone git@github.com:primalivet/dotfiles.git
```

After that you'll need to have GNU Stow installed. It's an application that manages symlinks.

```
$ sudo apt-get update
$ sudo apt-get install stow
```
When GNU Stow is installed you just `cd` into the dotfiles directory and then use the following commands to put the dotfiles in your `~` directory.

```
# switch <dir> for the directory of the program configs your want to install
$ stow --no-folding <dir> -t ~

# this is how you would install the config for neovim for example.
$ stow --no-folding nvim -t ~
```
If you clone the dotfiles to `~/dotfiles` you don't need the `-t <target>` flag when using GNU Stow. It will default to the parent directory of your current working directory.

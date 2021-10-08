# dotfiles

I try to keep this as simple as possible. Use `git clone` to get it on your
computer. What directory you clone it to doesn't matter.

```
$ git clone git@github.com:primalivet/dotfiles.git
```

After that you'll need to have GNU Stow installed. It's an application that
manages symlinks.

For __Debian based__
```
$ sudo apt-get install stow
```

For __Macintosh__
```
$ brew install stow
```

When GNU Stow is installed you just `cd` into the dotfiles directory and then
use the following commands to put the dotfiles in your `~` directory.

## A note on `--no-folding`

The `--no-folding` option traverses the source directory and symlinks each file
to the coresponding location in the destination/target (`-t`) directory. It'll
create directories needed to match the exact directory structure of the source.

Without the `--no-folding` option only the files and folder directly inside
the "stowed dir" will be symlinked, on level only. _This is generally not the
wanted behaviour for dotfiles_.

## Examples

__ATTN__ As `karabiner` is unable to use symlinked configuration files we have
to skip the `--no-folding` when linking Karabiner dotfiles. Read more at
[Karabiner documentation](https://karabiner-elements.pqrs.org/docs/manual/misc/configuration-file-path/).

```
# switch <dir> for the directory of the program configs your want to install
$ stow --no-folding <dir> -t ~

# this is how you would install the config for neovim for example.
$ stow --no-folding nvim -t ~

# As the above note says this is how to do it for Karabiner
$ stow karabiner -t ~
```

If you clone the dotfiles to `~/dotfiles` you don't need the `-t <target>` flag
when using GNU Stow. It will default to the parent directory of your current
working directory.

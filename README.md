# dotfiles
Works like most other peoples dotfiles. Clone it to your `$HOME` directory like...

```
$ git clone git@github.com:primalivet/dotfiles.git ~
```

After that you'll need to have GNU Stow installed.

```
$ sudo apt-get update
$ sudo apt-get install stow
```

GNU Stow is awesome and basically creates the symlinks in your `$HOME` when you run `$ stow [package-name]`.

```
# installs bash config
$ stow bash 

#installs tmux and vim config files
$ stow tmux vim
```

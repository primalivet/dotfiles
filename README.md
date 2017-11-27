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

GNU Stow is awesome and basically creates the symlinks in your `$HOME` directory when you run `$ stow [package-name]`. Provided you cloned this repo yo your `$HOME` directory.

```
# installs bash config
$ stow bash 

#installs tmux and vim config files
$ stow tmux vim
```

Incase you cloned this repo to somewhere else. You `cd` over to "somewhere else" and run Stow with the target option and give it your `$HOME` directory, `~`.

```
stow vim -t ~ 
```

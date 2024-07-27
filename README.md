# dotfiles

This repository contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Dependencies
```
$ sudo pacman -S git stow
```

## Installation

First, check out the dorgiles repo in your $HOME directory using git clone

```
$ git clone git@github.com/Sara01-s/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```

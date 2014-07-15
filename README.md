# Workstation

Provision your OS X workstation. Inspriration from [Laptop by Thoughtbot](https://github.com/thoughtbot/laptop).

## Requirements

Make sure that a C compiler is installed:

```console
$ which gcc #=> /usr/bin/gcc
```

Otherwise install the [Command Line Tools for XCode](https://developer.apple.com/downloads/index.action).

## Install

Run the provision script:

```console
$ ./script/provision.sh
```

## Provisioning

The provision script sets up:

### Essentials

- Oh-My-Zsh, framework for your ZSH configuration [website](http://ohmyz.sh/) [github](https://github.com/robbyrussell/oh-my-zsh)
- Homebrew, package manager for OS X [website](http://brew.sh/) [github](https://github.com/Homebrew/homebrew)
- Homebrew Cask, binary manager for OS X [website](http://caskroom.io/) [github](https://github.com/caskroom/homebrew-cask)

### Packages

- Git, a distributed version control system [website](http://git-scm.com/)
- Curl, a library for transferring data with URL syntax [website](http://curl.haxx.se/)
- OpenSSL, full-strength general purpose cryptography library [website](https://www.openssl.org/)
- Postgres, relational data store [website](http://www.postgresql.org/) [github](https://github.com/postgres/postgres)
- Redis, key-value data store [website](http://redis.io/) [github](https://github.com/antirez/redis)
- ImageMagick, library to manipulate images [website](http://www.imagemagick.org/)
- QT, cross-platform application and UI framework (headless javascript testing) [website](http://qt-project.org/)

### Ruby development tools

- RVM, Ruby version manager [website](https://rvm.io/) [github](https://github.com/wayneeseguin/rvm)
- Ruby, a dynamic, open source programming language [website](https://www.ruby-lang.org/en/) [github](https://github.com/ruby/ruby)
- Bundler, Ruby application dependencies manager [website](http://bundler.io/) [github](https://github.com/bundler/bundler)

### Binaries

- GitX-dev, a GUI for Git [website](http://rowanj.github.io/gitx/) [github](https://github.com/rowanj/gitx)
- VirtualBox, a x86 viritualization host [website](https://www.virtualbox.org/)
- Vagrant, a tool for building viritual machines/environments [website](http://www.vagrantup.com/) [github](https://github.com/mitchellh/vagrant)
- iTerm 2, a modern age terminal [website](http://www.iterm2.com/)
- Spectacle, a tool to organize your windows without using a mouse [website](http://spectacleapp.com/) [github](https://github.com/eczarny/spectacle)




This script is design to be as idempotent as possible. So you're safe to run it multiple times.

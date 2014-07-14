# Workstation

Provision your OS X workstation. Inspriration from [Laptop by Thoughtbot](https://github.com/thoughtbot/laptop).

## Requirements

Make sure that a C compiler is installed:

```console
which gcc #=> /usr/bin/gcc
```

Otherwise install the [Command Line Tools for XCode](https://developer.apple.com/downloads/index.action).

## Install

Run the provision script:

```console
$ ./bin/provision.sh
```

## Provisioning

The provision script sets up:

- Oh-My-Zsh, framework for your ZSH configuration [website](http://ohmyz.sh/) [github](https://github.com/robbyrussell/oh-my-zsh)
- Homebrew, package manager for OS X [website](http://brew.sh/) [github](https://github.com/Homebrew/homebrew)
- Git, a distributed version control system [website](http://git-scm.com/)
- Curl, a library for transferring data with URL syntax [website](http://curl.haxx.se/)
- OpenSSL, full-strength general purpose cryptography library [website](https://www.openssl.org/)
- Postgres, relational data store [website](http://www.postgresql.org/) [github](https://github.com/postgres/postgres)
- Redis, key-value data store [website](http://redis.io/) [github](https://github.com/antirez/redis)
- ImageMagick, library to manipulate images [website](http://www.imagemagick.org/)
- QT, cross-platform application and UI framework (headless javascript testing) [website](http://qt-project.org/)
- RVM, Ruby version manager [website](https://rvm.io/) [github](https://github.com/wayneeseguin/rvm)
- Ruby, a dynamic, open source programming language [website](https://www.ruby-lang.org/en/) [github](https://github.com/ruby/ruby)
- Bundler, Ruby application dependencies manager [website](http://bundler.io/) [github](https://github.com/bundler/bundler)

This script is design to be as idempotent as possible. So you're safe to run it multiple times.

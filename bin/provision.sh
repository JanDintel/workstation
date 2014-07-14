#!/bin/bash

set -e
# set -x

SYSTEM_LIBRARIES_PATH=/usr/bin
HOMEBREW_LIBRARIES_PATH=/usr/local/bin

DEFAULT_RUBY_VERSION=2.1.2
EXTRA_RUBY_VERSIONS=(1.9.3-p448 1.9.3-p547 2.0.0)
RUBIES=($DEFAULT_RUBY_VERSION ${EXTRA_RUBY_VERSIONS[*]})

info_echo() {
  echo -e "\033[0;36m$1\033[0m"
}

success_echo() {
  echo -e "\033[0;32m$1\033[0m"
}

warning_echo() {
  echo -e "\033[0;33m$1\033[0m"
}

error_echo() {
  echo -e "\033[0;31m$1\033[0m"
}

show_introduction() {
  info_echo "This script will provision your workstation"
  info_echo "For more information see the README"
}

show_conclusion() {
  info_echo "Your workstation is provisioned"
}

install_ohmyzsh() {
  if [ -d ~/.oh-my-zsh ]; then
    success_echo "Oh My Zsh already installed"
  else
    warning_echo "Installing Oh My Zsh..."
    curl -L http://install.ohmyz.sh | sh
    success_echo "Oh My Zsh installed"
  fi
}

install_homebrew() {
  if command -v brew &>/dev/null; then
    success_echo "Homebrew already installed"
  else
    warning_echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
    success_echo "Homebrew installed"
  fi
}

update_homebrew() {
  warning_echo "Update homebrew formulas..."
  brew update
  success_echo "Homebrew formulas updated"
}

brew_configure_path() {
  warning_echo "Configuring PATH for homebrew..."

  # warning_echo "Loading ZSH PATH first..."
  # source $HOME/.zshrc
  # error_echo "PENDING"
  # success_echo "Loaded ZSH PATH"

  first_loaded_library_path="$(echo $PATH | grep -o -E -m1 $HOMEBREW_LIBRARIES_PATH\|$SYSTEM_LIBRARIES_PATH | head -1)"
  if [ $first_loaded_library_path == $HOMEBREW_LIBRARIES_PATH ]; then
    success_echo "The PATH is correctly configured for homebrew"
  else
    error_echo "The PATH is NOT correctly configured for homebrew"
    brew_fix_path
  fi

  success_echo "Configured PATH for homebrew"
}

brew_fix_path() {
  warning_echo "Fixing PATH for homebrew..."
  echo 'export PATH="/usr/local/bin:$PATH/usr/bin:/bin:/usr/sbin:/sbin"' >> $HOME/.zshrc
  success_echo "Fixed PATH for homebrew"
}

brew_install_or_upgrade_formula() {
  if brew list -1 | grep -Fqx "$1"; then
    success_echo "$1 already installed"
    warning_echo "Upgrading formula $1"
    (brew upgrade "$@") || true
    success_echo "$1 formula upgraded"
  else
    warning_echo "Installing formula $1..."
    brew install "$@"
    success_echo "$1 formula installed"
  fi
}

brew_link_formula() {
  warning_echo "Linking formula $1"
  brew link "$@"
  success_echo "$1 formula linked"
}

install_rvm() {
  if command -v rvm &>/dev/null; then
    success_echo "RVM already installed"
  else
    warning_echo "Installing RVM..."
    \curl -sSL https://get.rvm.io | bash -s stable
    success_echo "RVM installed"
  fi
}

rvm_configure_as_function() {
  warning_echo "Configuring RVM as function..."
  source /Users/janvanderpas/.rvm/scripts/rvm
  success_echo "Configured RVM as function"
}

install_rvm_requirements() {
  warning_echo "Installing RVM requirements..."
  rvm requirements
  success_echo "RVM requirements installed"
}

rvm_install_ruby() {
  if rvm list | grep -Fq "$1"; then
    success_echo "Ruby version $1 already installed"
  else
    warning_echo "Installing Ruby version $1..."
    rvm install "$@"
    success_echo "Ruby version $1 installed"
  fi
}

rvm_install_rubies() {
  ruby_versions=$@
  warning_echo "Installing Ruby versions $ruby_versions..."
  for ruby_version in $ruby_versions; do
    rvm_install_ruby $ruby_version
  done
  success_echo "Ruby versions $ruby_versions installed"
}

rvm_configure_default_ruby() {
  warning_echo "Configuring Ruby version $1 as default..."
  source ~/.rvm/scripts/rvm
  rvm use "$1" --default
  success_echo "Configured Ruby version $1 as default"
}

update_ruby_gems() {
  warning_echo "Updating Rubygems..."
  gem update --system --no-document
  success_echo "Rubygems updated"
}

install_bundler() {
  warning_echo "Installing Bundler..."
  gem install bundler --no-document
  success_echo "Bundler installed"
}

bundler_configure_parallel_jobs() {
  warning_echo "Configuring Bundler for parallel jobs..."
  number_of_cores=$(sysctl -n hw.ncpu)
  bundle config --global jobs $((number_of_cores - 1))
  success_echo "Configured Bundler"
}

main() {
  show_introduction

  install_ohmyzsh
  install_homebrew
  update_homebrew

  brew_configure_path

  brew_install_or_upgrade_formula 'git'
  brew_install_or_upgrade_formula 'curl'
  brew_link_formula 'curl' '--force'
  brew_install_or_upgrade_formula 'openssl'
  brew_link_formula 'openssl' '--force'
  brew_install_or_upgrade_formula 'postgres' '--no-phyton'
  brew_install_or_upgrade_formula 'redis'
  brew_install_or_upgrade_formula 'imagemagick'
  brew_install_or_upgrade_formula 'qt'

  install_rvm
  install_rvm_requirements
  
  rvm_configure_as_function
  rvm_install_rubies ${RUBIES[*]}
  rvm_configure_default_ruby $DEFAULT_RUBY_VERSION

  update_ruby_gems
  install_bundler
  bundler_configure_parallel_jobs

  show_conclusion
}

main

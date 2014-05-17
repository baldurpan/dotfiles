#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)" > /tmp/homebrew-install.log
fi

# Upgrade homebrew
brew update

# Install homebrew packages
brew bundle $ZSH/homebrew/Brewfile
# Install cask packages
brew bundle $ZSH/homebrew/Caskfile

$ZSH/homebrew/configure.sh

brew cleanup

exit 0

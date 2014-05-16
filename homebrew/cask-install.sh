# Install native apps
brew tap phinze/homebrew-cask
brew tap caskroom/versions
brew install brew-cask

function installcask() {
        brew cask install "${@}" 2> /dev/null
}

installcask dropbox
installcask google-chrome
installcask google-chrome-canary
installcask google-drive
installcask firefox
installcask iterm2-beta
installcask the-unarchiver
installcask vlc
installcask spotify
installcask appcleaner
installcask sublime-text3
installcask atom
installcask cakebrew
installcask expandrive
installcask filezilla
installcask skype
installcask transmission
installcask adobe-reader
installcask onepassword
installcask twitter

# Clean up the mess
brew cask cleanup

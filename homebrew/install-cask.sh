# Install native apps
brew tap phinze/homebrew-cask
brew tap caskroom/versions
brew install brew-cask

function installcask() {
        brew cask install "${@}" 2> /dev/null
}

installcask dropbox
installcask google-chrome
installcask google-drive
installcask firefox
installcask iterm2
installcask the-unarchiver
installcask vlc
installcask spotify
installcask appcleaner
installcask sublime-text-3
installcask atom
installcask cakebrew
installcask expandrive
installcask filezilla
installcask skype
installcask transmission

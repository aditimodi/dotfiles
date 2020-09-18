

## changing various macos default settings using command line

defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 7
defaults write NSGlobalDomain KeyRepeat -int 0
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.dock tilesize -int 36


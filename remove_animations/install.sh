# os x

# window opening animatons
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
# defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool true

# resizing animation
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
# defaults write NSGlobalDomain NSWindowResizeTime -float 0.2

# quick look
defaults write -g QLPanelAnimationDuration -float 0
# defaults delete -g QLPanelAnimationDuration

# launch app from dock
defaults write com.apple.dock launchanim -bool false
# defaults write com.apple.dock launchanim -bool true

# reboot

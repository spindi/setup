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

# opening and closing windows and popovers
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

# smooth scrolling
defaults write -g NSScrollAnimationEnabled -bool false

# showing and hiding sheets, resizing preference windows, zooming windows
# float 0 doesn't work
defaults write -g NSWindowResizeTime -float 0.001

# opening and closing Quick Look windows
defaults write -g QLPanelAnimationDuration -float 0

# rubberband scrolling (doesn't affect web views)
defaults write -g NSScrollViewRubberbanding -bool false

# resizing windows before and after showing the version browser
# also disabled by NSWindowResizeTime -float 0.001
defaults write -g NSDocumentRevisionsWindowTransformAnimation -bool false

# showing a toolbar or menu bar in full screen
defaults write -g NSToolbarFullScreenAnimationDuration -float 0

# scrolling column views
defaults write -g NSBrowserColumnAnimationSpeedMultiplier -float 0

# showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide-delay -float 0

# showing and hiding Mission Control, command+numbers
defaults write com.apple.dock expose-animation-duration -float 0

# showing and hiding Launchpad
defaults write com.apple.dock springboard-show-duration -float 0
defaults write com.apple.dock springboard-hide-duration -float 0

# changing pages in Launchpad
defaults write com.apple.dock springboard-page-duration -float 0

# at least AnimateInfoPanes
defaults write com.apple.finder DisableAllAnimations -bool true

# reboot
# or, possibly `killall Dock`

#!/bin/bash

selectedFolderPath=$1

## Set Screensaver to Photo Slideshow
/usr/bin/defaults -currentHost write com.apple.screensaver 'CleanExit' -string "YES"
/usr/bin/defaults -currentHost write com.apple.screensaver 'PrefsVersion' -int "100"
/usr/bin/defaults -currentHost write com.apple.screensaver 'idleTime' -int "300"
/usr/bin/defaults -currentHost write com.apple.screensaver "moduleDict" -dict-add "path" -string "/System/Library/Frameworks/ScreenSaver.framework/Resources/iLifeSlideshows.saver"
/usr/bin/defaults -currentHost write com.apple.screensaver "moduleDict" -dict-add "type" -int "0"
/usr/bin/defaults -currentHost write com.apple.screensaver 'ShowClock' -bool "false"
/usr/bin/defaults -currentHost write com.apple.screensaver 'tokenRemovalAction' -int "0"

## Set Type of Slideshow to "Shifting Tiles" (Results inconsistent)
/usr/bin/defaults -currentHost write com.apple.ScreenSaver.iLifeSlideshows 'styleKey' -string "ShiftingTiles"

## Set location of photos to Fan Art
/usr/bin/defaults -currentHost write com.apple.ScreenSaverPhotoChooser 'SelectedSource' -int "4"
/usr/bin/defaults -currentHost write com.apple.ScreenSaverPhotoChooser 'SelectedFolderPath' "$selectedFolderPath"
/usr/bin/defaults -currentHost write com.apple.ScreenSaverPhotoChooser 'ShufflesPhotos' -bool "true"

## Removes the .plist LaunchAgent from inside the User Launch Agent Folder.
rm -f ~/Library/LaunchAgents/set-screensaver.plist

## Reload preference to pick up the changes
killall cfprefsd

#!/bin/bash

selectedFolderPath=$1

## Set location of photos to Fan Art
/usr/bin/defaults -currentHost write com.apple.ScreenSaverPhotoChooser 'SelectedFolderPath' "$selectedFolderPath"

## Removes the .plist LaunchAgent from inside the User Launch Agent Folder.
rm -f ~/Library/LaunchAgents/set-screensaver.plist

## Reload preference to pick up the changes
killall cfprefsd

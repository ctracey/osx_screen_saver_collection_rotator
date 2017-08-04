#!/bin/bash

function send_notification()
{
  message="$current_collection ⇨ $next_collection"
  title="Screen Saver Collection"
  osx_notification_cmd="osascript -e 'display notification \""$message"\" with title \""$title"\"'"
  eval $osx_notification_cmd
}

screen_saver_folder=`/usr/bin/defaults -currentHost read com.apple.ScreenSaverPhotoChooser 'SelectedFolderPath'`
echo "Current screen saver folder is $screen_saver_folder"

current_collection=`basename "$screen_saver_folder"`
collections_folder=`dirname "$screen_saver_folder"`

next_collection=`./bin/next_child_folder.sh "$collections_folder" $current_collection`
echo "Updating screen saver to shifting tiles with $collections_folder/$next_collection"

`./bin/change_screensaver_folder.sh "$collections_folder/$next_collection"`
echo "Screen Saver updated"

send_notification

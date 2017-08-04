#!/bin/bash

default_collection_path="/Library/Screen Savers/Default Collections/1-National Geographic"
collection_path=$@

if [ ! "${collection_path}" ]
then
  echo 'No collection path provided ... using default.'
  collection_path=$default_collection_path
fi

`./bin/change_screensaver_folder.sh "$collection_path"`

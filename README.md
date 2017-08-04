
OSX Screen Saver Collection Rotator
===================================

Setup
-----

Create a new parent folder for your image collections in `/Library/Screen Savers/`
Warning: OSX wont let this script work if your collections parent folder is not in `/Library/Screen Savers/`

Then run this script to set your screen saver to the shifting tiles screen saver using one of your folders
`./bin/setup.sh /Library/Screen Savers/<your parent foldler>/<your starting collection folder>`

Note: setup defaults to `/Library/Screen Savers/Default Collections/1-National Geographic` if no path is provided

Usage
-----

run `./bin/switch.sh`

Then check the screen saver settings. The screen saver should now be using the next collection in your collections folder as long as you have more than one.

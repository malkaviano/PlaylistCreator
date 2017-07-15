# PlaylistCreator

#### This script was created to my personal use, intended to produce simple playlists from my computer media folders.

I created it so I can watch my stuff with MPV. It may have other uses... O.o

### How to use:
Edit runner.rb, change the settings to your preferences then run runner.rb with ruby command.

### Settings
* media_dir = media folder (collections folder)
* media_format = the format of the file to be inserted into the playlist
* shuffle: write the playlist shuffled.
* override: recreate the playlist file if it already exists.

Resulting file has the same of the folder with m3u extension.

The script will create playlist for everyfolder inside your media folder. If a folder does not have any media of the desired format an empty m3u will be created (Working as Intended).

TODO: Accept more than one file format.

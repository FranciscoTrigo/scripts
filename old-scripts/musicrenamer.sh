#!/bin/sh
#auto_organize - a that script renames music files according to artist, album, title and track number tags

MUSIC_DIR=/home/yamifrankc/music/

for i in "$@"; do 

    # check for file type
    if (ls "$i" | grep flac) 
    then
                  # extract information from flac tag
        ARTIST=$(metaflac --show-tag=ARTIST "$i" | sed -e s/ARTIST=//) 
        ALBUM=$(metaflac --show-tag=ALBUM "$i" | sed -e s/ALBUM=//)
        TITLE=$(metaflac --show-tag=TITLE "$i" | sed -e s/TITLE=//)
        TRACK_NUM=$(metaflac --show-tag=TRACKNUMBER "$i" | sed -e s/TRACKNUMBER=//)
        DISC_NUMBER=$(metaflac --show-tag=DISCNUMBER "$i" | sed -e s/DISCNUMBER=//)

        
        #check if disc number is included
        if [ -z "$DISC_NUMBER" ]
        then
            RENAMING_SCHEME="$MUSIC_DIR/$ARTIST/$ALBUM/$TITLE.flac"
        else
            RENAMING_SCHEME="$MUSIC_DIR/$ARTIST/$ALBUM/$TITLE.flac"
        fi
                            
                            echo "$RENAMING_SCHEME"

        mkdir -p "$MUSIC_DIR/$ARTIST/$ALBUM/"
        cp -vi "$i" "$RENAMING_SCHEME"

    elif (ls "$i" | grep mp3)
    then
        # extract information from mp3 tag
        ARTIST=$(mp3info -p %a "$i")
        ALBUM=$(mp3info -p %l "$i")
        TITLE=$(mp3info -p %t "$i")
        TRACK_NUM=$(mp3info -p %02n "$i")

                            # check if disc number is included
        if [ -z "$DISC_NUMBER" ]
        then
            RENAMING_SCHEME="$MUSIC_DIR/$ARTIST/$ALBUM/$TITLE.mp3"
        else
            RENAMING_SCHEME="$MUSIC_DIR/$ARTIST/$ALBUM/$TITLE.mp3"
        fi

                            echo "$RENAMING_SCHEME"

        mkdir -p "$MUSIC_DIR/$ARTIST/$ALBUM/"
        cp -vi "$i" "$RENAMING_SCHEME"
    fi
done

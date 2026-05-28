#!/bin/bash
CACHE_DIR="/home/whothis/.cache/rmpc/youtube"
echo "$(date): Save script ran" >> /tmp/rmpc_debug.log
MUSIC_DIR="/home/whothis/Music"

SONG=$(rmpc song 2>/dev/null)
[ -z "$SONG" ] && exit 0

FILE=$(echo "$SONG" | grep -o '"file":"[^"]*"' | sed 's/"file":"//;s/"//')
ARTIST=$(echo "$SONG" | grep -o '"artist":"[^"]*"' | sed 's/"artist":"//;s/"//' | head -1)
TITLE=$(echo "$SONG" | grep -o '"title":"[^"]*"' | sed 's/"title":"//;s/"//' | head -1)

[ -z "$ARTIST" ] && exit 0
[ -z "$TITLE" ] && exit 0
[ -z "$FILE" ] && exit 0

FILENAME=$(basename "$FILE")
SOURCE="$CACHE_DIR/$FILENAME"
[ ! -f "$SOURCE" ] && exit 0

# Strip "Artist - " prefix from title for clean filename
if echo "$TITLE" | grep -q "^$ARTIST - "; then
    CLEAN_TITLE=$(echo "$TITLE" | sed "s/^$ARTIST - //")
else
    CLEAN_TITLE="$TITLE"
fi

ARTIST_CLEAN=$(echo "$ARTIST" | tr '/' '_')
TITLE_CLEAN=$(echo "$CLEAN_TITLE" | tr '/' '_')
EXT="${FILENAME##*.}"

TARGET_FILE="$MUSIC_DIR/$ARTIST_CLEAN - $TITLE_CLEAN.$EXT"
if [ ! -f "$TARGET_FILE" ]; then
    cp "$SOURCE" "$TARGET_FILE"
    mpc update 2>/dev/null
fi

######## We need SyncedLyrics for this so make sure you install syncedlyrics package ######
######## We need ueberzugpp for album art

#!/bin/bash
LYRICS_DIR="/home/whothis/Music/lyrics"
echo "$(date): Lyrics script ran" >> /tmp/rmpc_debug.log

SONG=$(rmpc song 2>/dev/null)
[ -z "$SONG" ] && exit 0

ARTIST=$(echo "$SONG" | grep -o '"artist":"[^"]*"' | sed 's/"artist":"//;s/"//' | head -1)
FULL_TITLE=$(echo "$SONG" | grep -o '"title":"[^"]*"' | sed 's/"title":"//;s/"//' | head -1)
[ -z "$ARTIST" ] || [ -z "$FULL_TITLE" ] && exit 0

# Search title = strip prefix for better search results
if echo "$FULL_TITLE" | grep -q "^$ARTIST - "; then
    SEARCH_TITLE=$(echo "$FULL_TITLE" | sed "s/^$ARTIST - //")
else
    SEARCH_TITLE="$FULL_TITLE"
fi

SAFE_NAME=$(echo "$ARTIST - $SEARCH_TITLE" | tr '/' '_')
LRC_FILE="$LYRICS_DIR/$SAFE_NAME.lrc"
[ -f "$LRC_FILE" ] && exit 0

# Download with search title
syncedlyrics --output "$LRC_FILE.tmp" "$ARTIST - $SEARCH_TITLE" 2>/dev/null

# Fallback: try with full title
if [ ! -f "$LRC_FILE.tmp" ] && [ "$SEARCH_TITLE" != "$FULL_TITLE" ]; then
    syncedlyrics --output "$LRC_FILE.tmp" "$ARTIST - $FULL_TITLE" 2>/dev/null
fi

if [ -f "$LRC_FILE.tmp" ]; then
    # KEY: Use the FULL title from song metadata for [ti:] tag
    echo "[ar:$ARTIST]" > "$LRC_FILE"
    echo "[ti:$FULL_TITLE]" >> "$LRC_FILE"
    cat "$LRC_FILE.tmp" >> "$LRC_FILE"
    rm "$LRC_FILE.tmp"
fi

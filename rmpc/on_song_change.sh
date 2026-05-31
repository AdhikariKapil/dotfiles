#!/bin/bash
echo "$(date): Hook fired" >> /tmp/rmpc_debug.log

# --- Fetch Lyrics ---
LYRICS_DIR="/home/whothis/Music/lyrics"
SONG=$(rmpc song 2>/dev/null)
if [ -n "$SONG" ]; then
    ARTIST=$(echo "$SONG" | grep -o '"artist":"[^"]*"' | sed 's/"artist":"//;s/"//' | head -1)
    FULL_TITLE=$(echo "$SONG" | grep -o '"title":"[^"]*"' | sed 's/"title":"//;s/"//' | head -1)
    
    if [ -n "$ARTIST" ] && [ -n "$FULL_TITLE" ]; then
        if echo "$FULL_TITLE" | grep -q "^$ARTIST - "; then
            SEARCH_TITLE=$(echo "$FULL_TITLE" | sed "s/^$ARTIST - //")
        else
            SEARCH_TITLE="$FULL_TITLE"
        fi
        SAFE_NAME=$(echo "$ARTIST - $SEARCH_TITLE" | tr '/' '_')
        LRC_FILE="$LYRICS_DIR/$SAFE_NAME.lrc"
        if [ ! -f "$LRC_FILE" ]; then
            syncedlyrics --output "$LRC_FILE.tmp" "$ARTIST - $SEARCH_TITLE" 2>/dev/null
            if [ ! -f "$LRC_FILE.tmp" ] && [ "$SEARCH_TITLE" != "$FULL_TITLE" ]; then
                syncedlyrics --output "$LRC_FILE.tmp" "$ARTIST - $FULL_TITLE" 2>/dev/null
            fi
            if [ -f "$LRC_FILE.tmp" ]; then
                echo "[ar:$ARTIST]" > "$LRC_FILE"
                echo "[ti:$FULL_TITLE]" >> "$LRC_FILE"
                cat "$LRC_FILE.tmp" >> "$LRC_FILE"
                rm "$LRC_FILE.tmp"
            fi
        fi
    fi

    # # --- Save to Music ---
    # CACHE_DIR="/home/whothis/.cache/rmpc/youtube"
    # MUSIC_DIR="/home/whothis/Music"
    # FILE=$(echo "$SONG" | grep -o '"file":"[^"]*"' | sed 's/"file":"//;s/"//')
    # if [ -n "$FILE" ]; then
    #     FILENAME=$(basename "$FILE")
    #     SOURCE="$CACHE_DIR/$FILENAME"
    #     if [ -f "$SOURCE" ]; then
    #         if echo "$FULL_TITLE" | grep -q "^$ARTIST - "; then
    #             CLEAN_TITLE=$(echo "$FULL_TITLE" | sed "s/^$ARTIST - //")
    #         else
    #             CLEAN_TITLE="$FULL_TITLE"
    #         fi
    #         ARTIST_CLEAN=$(echo "$ARTIST" | tr '/' '_')
    #         TITLE_CLEAN=$(echo "$CLEAN_TITLE" | tr '/' '_')
    #         EXT="${FILENAME##*.}"
    #         TARGET_FILE="$MUSIC_DIR/$ARTIST_CLEAN - $TITLE_CLEAN.$EXT"
    #         if [ ! -f "$TARGET_FILE" ]; then
    #             cp "$SOURCE" "$TARGET_FILE"
    #             mpc update 2>/dev/null &
    #         fi
    #     fi
    # fi
fi

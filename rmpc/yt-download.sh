#!/bin/bash

# 1. Ask for the input type
MODE=$(printf "URL\nSearch" | fzf --prompt="Download Type > " --height=~15% --layout=reverse)
[ -z "$MODE" ] && exit 0

# 2. Get input (URL or Search Term)
if [ "$MODE" = "URL" ]; then
    read -p "Paste YouTube URL: " INPUT
    [ -z "$INPUT" ] && exit 0
    YT_INPUT="$INPUT"
else
    read -p "Search YouTube: " INPUT
    [ -z "$INPUT" ] && exit 0

    # Hybrid Interactive Search: Fetch top 10 results and let user pick with fzf
    # We use yt-dlp to fetch metadata only (no download)
    SELECTED_VIDEO=$(yt-dlp "ytsearch10:$INPUT" --flat-playlist -O "%(id)s"$'\t'"%(title)s" | fzf --prompt="Select Video > " --height=~50% --layout=reverse --delimiter='\t' --with-nth=2)

    [ -z "$SELECTED_VIDEO" ] && exit 0
    VIDEO_ID=$(echo "$SELECTED_VIDEO" | cut -f1)
    YT_INPUT="https://www.youtube.com/watch?v=$VIDEO_ID"
fi

# 3. Pick the folder
FOLDER=$(find ~/Music -mindepth 1 -maxdepth 1 -type d -not -name "lyrics" -printf "%f\n" | sort | fzf --prompt="Select Folder > " --height=~30% --layout=reverse --print-query)

SELECTED=$(echo "$FOLDER" | tail -n 1)
QUERY=$(echo "$FOLDER" | head -n 1)

if [ -z "$SELECTED" ] && [ -n "$QUERY" ]; then
    SELECTED="$QUERY"
    mkdir -p "$HOME/Music/$SELECTED"
elif [ -z "$SELECTED" ]; then
    exit 0
fi

TARGET_DIR="$HOME/Music/$SELECTED"

# 4. Download with Metadata Embedding and Clean Names

# Added --embed-metadata and --embed-thumbnail for proper tags
yt-dlp -x --audio-format opus --audio-quality 0 \
       --embed-metadata --embed-thumbnail \
       -o "$TARGET_DIR/%(artist)s - %(title)s.%(ext)s" \
       "$YT_INPUT"

# 5. Trigger MPD update and add to queue
if [ $? -eq 0 ]; then
    # Find the most recently downloaded file
    NEW_FILE=$(find "$TARGET_DIR" -type f -name "*.opus" -printf '%T@ %p\n' | sort -n | tail -1 | cut -d' ' -f2-)
    
    if [ -n "$NEW_FILE" ]; then
        REL_PATH="${NEW_FILE#$HOME/Music/}"
        
        # Fix Metadata Lag: Force MPD to rescan just this file and wait
        mpc update "$REL_PATH"
        sleep 1
        
        # Add and play
        mpc add "$REL_PATH"
        mpc play
        
    fi
fi

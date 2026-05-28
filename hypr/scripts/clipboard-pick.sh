#!/bin/bash
SELECTED=$(cliphist list | rofi -dmenu -p "Clipboard History")
if [ -n "$SELECTED" ]; then
    echo "$SELECTED" | cliphist decode | wl-copy
    notify-send "📋 Copied to clipboard"
fi

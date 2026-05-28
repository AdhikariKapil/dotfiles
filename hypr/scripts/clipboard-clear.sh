#!/bin/bash
CONFIRM=$(echo -e "Yes\nNo" | rofi -dmenu -p "Clear all clipboard history?")
if [ "$CONFIRM" = "Yes" ]; then
    cliphist wipe
    notify-send "🗑️ Clipboard history cleared"
fi

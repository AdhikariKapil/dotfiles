#!/bin/bash

WALLPAPER_DIR="$HOME/.config/themes/current/wallpapers"

WALLPAPER=$(
    find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.webp" \) -printf "%f\n" | sort | while read -r file; do
        echo -en "$file\x00icon\x1fthumbnail://$WALLPAPER_DIR/$file\n"
    done | rofi -dmenu -p "Wallpaper" -show-icons -theme ~/.config/rofi/picker.rasi
)

if [[ -n $WALLPAPER ]]; then
    awww img "$WALLPAPER_DIR/$WALLPAPER"
    notify-send "Wallpaper changed" "✅ $WALLPAPER"
fi

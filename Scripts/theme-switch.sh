#!/bin/bash

THEMES_DIR="$HOME/.config/themes"
CURRENT="$THEMES_DIR/current"

THEME=$(
    for dir in "$THEMES_DIR"/*/; do
        name=$(basename "$dir")
        [[ "$name" == "current" ]] && continue
        preview="$dir/preview.png"
        if [[ -f "$preview" ]]; then
            echo -en "$name\x00icon\x1fthumbnail://$preview\n"
        else
            echo "$name"
        fi
    done | rofi -dmenu -p "Theme" -show-icons -theme ~/.config/rofi/picker.rasi
)

if [[ -z $THEME ]]; then
    exit 0
fi

THEME_PATH="$THEMES_DIR/$THEME"

# Switch symlink
ln -sfn "$THEME_PATH" "$CURRENT"

# Apply first wallpaper
WALLPAPER=$(find "$THEME_PATH/wallpapers" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.webp" \) | sort | head -1)
if [[ -n $WALLPAPER ]]; then
    awww img "$WALLPAPER"
fi

# Reload Waybar and SwayNC
pkill -USR2 waybar 2>/dev/null
swaync-client -rs 2>/dev/null

# Apply GTK theme from theme folder
GTK_THEME_FILE="$THEME_PATH/gtk-theme.txt"
if [[ -f $GTK_THEME_FILE ]]; then
    GTK_THEME=$(cat "$GTK_THEME_FILE")
    # Check if theme exists
    if [[ -d "/usr/share/themes/$GTK_THEME" ]] || [[ -d "$HOME/.themes/$GTK_THEME" ]]; then
        gsettings set org.gnome.desktop.interface gtk-theme "$GTK_THEME"
    else
        gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
        notify-send "GTK Theme Missing" "⚠️ $GTK_THEME not found, using Adwaita-dark"
    fi
fi

# Symlink hyprlock config
if [[ -f "$THEME_PATH/hyprlock.conf" ]]; then
    ln -sf "$THEME_PATH/hyprlock.conf" "$HOME/.config/hypr/hyprlock.conf"
fi

notify-send "Theme Switched" "🎨 $THEME"

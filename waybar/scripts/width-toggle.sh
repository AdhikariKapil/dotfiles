#!/bin/bash

CONFIG="$HOME/.config/waybar/config.jsonc"

if grep -q '// "width":' "$CONFIG"; then
    # ENABLE width + remove mpd from modules
    sed -i 's|// "width":|"width":|' "$CONFIG"
    sed -i 's|"modules-left": \["pulseaudio", "cava", "mpd"\]|"modules-left": ["pulseaudio", "cava"]|' "$CONFIG"
    notify-send "Width: ON | mpd: hidden"
else
    # DISABLE width + add mpd back
    sed -i 's|"width":|// "width":|' "$CONFIG"
    sed -i 's|"modules-left": \["pulseaudio", "cava"\]|"modules-left": ["pulseaudio", "cava", "mpd"]|' "$CONFIG"
    notify-send "Width: OFF | mpd: shown"
fi

pkill -USR2 waybar

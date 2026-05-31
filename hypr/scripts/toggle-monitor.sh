#!/bin/bash
if hyprctl monitors | grep -q "^Monitor eDP-1"; then
    echo "eDP-1 is connected"
    # Set up for 4K with scaling on eDP-1 and keep HDMI-A-2 as it is
    cat > ~/.config/hypr/modules/monitors.lua << EOF
        hl.monitor({
            output = "HDMI-A-2",
            mode = "1920x1080@143.95",
            position = "0x0",
            scale = "1",
        })
        hl.monitor({
            output = "eDP-1",
            disabled = true
        })
EOF
else
    echo "eDP-1 is not connected"
    # Set up for 4K with scaling on eDP-1 and keep HDMI-A-2 as it is
    cat > ~/.config/hypr/modules/monitors.lua << EOF
        hl.monitor({
            output = "HDMI-A-2",
            mode = "1920x1080@143.95",
            position = "0x0",
            scale = "1",
        })
        hl.monitor({
            output = "eDP-1",
            mode = "1920x1080@144",
            position = "1920x0",
            scale = "1.25",
        })
EOF
fi


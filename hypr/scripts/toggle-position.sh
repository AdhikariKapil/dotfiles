#!/bin/bash
if hyprctl monitors | grep -A20 "HDMI-A-2" | grep -q "transform: 3"; then
    echo "Changing to horizontal transformation"
    cat > ~/.config/hypr/modules/transformation.lua << EOF
        hl.monitor({
            output = "HDMI-A-2",
            transform = 0,
        })
EOF
else
    echo "Changing to vertical transformation"
    cat > ~/.config/hypr/modules/transformation.lua << EOF
        hl.monitor({
            output = "HDMI-A-2",
            transform = 3,
        })
EOF
fi


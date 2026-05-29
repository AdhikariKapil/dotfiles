#!/bin/bash

THEME_CSS="$HOME/.config/themes/current/waybar.css"
OUTPUT="$HOME/.config/wlogout/style.css"

# Extract colors from theme
BG0=$(grep -oP '@define-color bg0 #\K[a-fA-F0-9]+' "$THEME_CSS" | head -1)
FG=$(grep -oP '@define-color fg #\K[a-fA-F0-9]+' "$THEME_CSS" | head -1)
BLUE=$(grep -oP '@define-color blue #\K[a-fA-F0-9]+' "$THEME_CSS" | head -1)

BG0_R=$((16#${BG0:0:2}))
BG0_G=$((16#${BG0:2:2}))
BG0_B=$((16#${BG0:4:2}))

BLUE_R=$((16#${BLUE:0:2}))
BLUE_G=$((16#${BLUE:2:2}))
BLUE_B=$((16#${BLUE:4:2}))

cat > "$OUTPUT" << EOF
* {
  font-family: "JetBrainsMono Nerd Font";
  font-size: 17px;
  color: #${FG};
  box-shadow: none;
}

window {
  background: rgba(${BG0_R}, ${BG0_G}, ${BG0_B}, 0.4);
  padding: 15px;
}

button {
  background-color: transparent;
  background-repeat: no-repeat;
  background-position: center;
  background-size: 30%;
  transition: all 0.3s ease-in-out;
}

button:active,
button:hover {
  background-repeat: no-repeat;
  background-position: center;
  background-size: 50%;
  padding: 0 50 0 50px;
  font-weight: bold;
  background-color: rgba(${BLUE_R}, ${BLUE_G}, ${BLUE_B}, 0.2);
}

#lock {
  background-image: image(url("/usr/share/wlogout/icons/lock.png"), url("/usr/local/share/wlogout/icons/lock.png"));
}

#logout {
  background-image: image(url("/usr/share/wlogout/icons/logout.png"), url("/usr/local/share/wlogout/icons/logout.png"));
}

#suspend {
  background-image: image(url("/usr/share/wlogout/icons/suspend.png"), url("/usr/local/share/wlogout/icons/suspend.png"));
}

#hibernate {
  background-image: image(url("/usr/share/wlogout/icons/hibernate.png"), url("/usr/local/share/wlogout/icons/hibernate.png"));
}

#shutdown {
  background-image: image(url("/usr/share/wlogout/icons/shutdown.png"), url("/usr/local/share/wlogout/icons/shutdown.png"));
}

#reboot {
  background-image: image(url("/usr/share/wlogout/icons/reboot.png"), url("/usr/local/share/wlogout/icons/reboot.png"));
}
EOF

echo "Generated wlogout style for current theme"

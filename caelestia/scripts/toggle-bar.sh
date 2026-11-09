#!/bin/bash
CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/caelestia/shell.json"
IFS=, read -r CURX CURY < <(hyprctl cursorpos | tr -d ' ')
MONITOR=$(hyprctl monitors -j | jq -r --argjson x "$CURX" --argjson y "$CURY" '
  .[] | select(.x <= $x and ($x < (.x + .width)) and .y <= $y and ($y < (.y + .height))) | .name
' | head -n1)
tmp=$(mktemp)
jq --arg m "$MONITOR" '
  .bar.excludedScreens |= (if (index($m) != null) then map(select(. != $m)) else . + [$m] end)
' "$CONFIG" > "$tmp" && mv "$tmp" "$CONFIG"

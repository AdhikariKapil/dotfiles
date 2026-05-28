-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
	hl.exec_cmd("hypridle &")
	hl.exec_cmd("awww-daemon &")
	hl.exec_cmd("swaync")
	hl.exec_cmd("waybar")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("hyprctl setcursor macOS 24")
	hl.exec_cmd("elephant &")
	hl.exec_cmd("walker --gapplication-service")

	-- === TMUX + HYPRCTL FIX ===
	-- Problem: tmux doesn't inherit HYPRLAND_INSTANCE_SIGNATURE,
	-- causing "Couldn't connect to socket" errors with hyprctl.
	-- Solution: Push the current signature into tmux on startup.
	-- Fails silently if tmux isn't running (harmless).
	hl.exec_cmd('tmux setenv -g HYPRLAND_INSTANCE_SIGNATURE "$HYPRLAND_INSTANCE_SIGNATURE"')
end)

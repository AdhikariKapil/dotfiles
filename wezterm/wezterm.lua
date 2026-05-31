-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

--- === APPEARANCE === ---
config.font_size = 11.5

--- Theme Section (Uncomment to select) ---
config.color_scheme = "Builtin Dark"
-- config.color_scheme = "iTerm2 Tango Dark"
-- config.color_scheme = "Github Dark (Gogh)"
-- config.color_scheme = "Google Dark (Gogh)"
-- config.color_scheme = "Grayscale (dark) (terminal.sexy)"
-- config.color_scheme = "Gruvbox dark, medium (base16)"

config.enable_scroll_bar = true
config.enable_tab_bar = false
config.window_padding = {
	left = 0,
	right = -1,
	top = 0,
	bottom = -1,
}
config.window_close_confirmation = "NeverPrompt"

--- === KEYBINDINGS === ---

config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {

	---=== Uncomment if you are not using tmux ===---
	-- Pane splitting
	{ key = "'", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = '"', mods = "LEADER|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

	-- Tab management
	{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = false }) },
	{ key = "j", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "k", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "t", mods = "LEADER", action = act.ShowTabNavigator },

	-- Pane navigation
	{ key = "h", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Right") },

	-- Resize pane mode
	{ key = "j", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },
	{ key = "k", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },
	{ key = "l", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },
	{ key = "h", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },

	-- Toggle pane zoom
	{ key = "m", mods = "ALT", action = act.TogglePaneZoomState },

	-- Copy mode (your bind v copy-mode / vi keys)
	{ key = "v", mods = "LEADER", action = act.ActivateCopyMode },
	{ key = "y", mods = "LEADER", action = act.CopyTo("Clipboard") },
}

config.key_tables = {}

-- Finally, return the configuration to wezterm:
return config

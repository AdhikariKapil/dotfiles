-- Pull in the wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()

--- === APPEARANCE === ---
config.font_size = 12

--- Theme Section (Uncomment to select) ---
-- config.color_scheme = "Builtin Dark"
-- config.color_scheme = "iTerm2 Tango Dark"
-- config.color_scheme = "Github Dark (Gogh)"
-- config.color_scheme = "Google Dark (Gogh)"
-- config.color_scheme = "Grayscale (dark) (terminal.sexy)"
config.color_scheme = "Gruvbox dark, medium (base16)"
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

config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {

	---=== Uncomment if you are not using tmux ===---
	-- -- Pane splitting
	-- { key = "'", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	-- { key = '"', mods = "LEADER|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	--
	-- -- Tab management
	-- { key = "c", mods = "LEADER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	-- { key = "x", mods = "LEADER", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
	--
	-- -- Pane navigation
	-- { key = "h", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Left") },
	-- { key = "j", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Down") },
	-- { key = "k", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Up") },
	-- { key = "l", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Right") },
	--
	-- -- Resize pane mode
	-- { key = "j", mods = "ALT", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
	-- { key = "k", mods = "ALT", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
	-- { key = "l", mods = "ALT", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
	-- { key = "h", mods = "ALT", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
	--
	-- -- Toggle pane zoom
	-- { key = "m", mods = "ALT", action = wezterm.action.TogglePaneZoomState },
	--
	-- Copy mode (your bind v copy-mode / vi keys)
	{ key = "v", mods = "LEADER", action = wezterm.action.ActivateCopyMode },
	{ key = "y", mods = "LEADER", action = wezterm.action.ActivateCopyMode }, -- yank in copy mode

	--- Popup windows ---
	-- Music popup
	-- { key = "a", mods = "LEADER", action = wezterm.action.SpawnCommandInNewWindow({ args = { "rmpc" } }) },
}

-- Finally, return the configuration to wezterm:
return config

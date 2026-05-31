--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Workspaces
hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-2", persistent = true })
hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-2", persistent = true })
hl.workspace_rule({ workspace = "3", monitor = "HDMI-A-2", persistent = true })
hl.workspace_rule({ workspace = "4", monitor = "HDMI-A-2", persistent = true })
hl.workspace_rule({ workspace = "5", monitor = "HDMI-A-2", persistent = true })

hl.layer_rule({
	name = "rofi pop",
	match = { namespace = "rofi" },
	dim_around = false,
})

hl.layer_rule({
	name = "notification-animation",
	match = { namespace = "swaync-control-center" },
	animation = "slide top",
})

-- Make a rule where kitty and vscodium always stays transparent even in fullscreen mode, and also make them floating and on workspace 2
-- hl.window_rule({
-- 	name = "transparent-wezterm-vscodium",
-- 	match = { class = "wezterm|vscodium" },
-- 	opacity = 0.7,
-- 	float = false,
-- })

-- Make wezterm transparent even in fullscreen mode
hl.window_rule({
	name = "transparent-wezterm",
	match = { class = "org.wezfurlong.wezterm" },
	opacity = 0.7,
	float = false,
})

-- Make kitty transparent even in fullscreen mode
hl.window_rule({
	name = "transparent-kitty",
	match = { class = "kitty" },
	opacity = 0.7,
	float = false,
})

-- Make vscodium transparent even in fullscreen kb
hl.window_rule({
	name = "transparent-vscodium",
	match = { class = "vscodium" },
	opacity = 0.7,
	float = false,
})

-- Make zathura transparent even in fullscreen kb
hl.window_rule({
	name = "transparent-org.pwmt.zathura",
	match = { class = "org.pwmt.zathura" },
	opacity = 0.7,
	float = false,
})

-- Make Bitwarden start in float mode
hl.window_rule({
	name = "Bitwarden Float",
	match = { class = "Bitwarden" },
	opacity = 1,
	float = true,
})

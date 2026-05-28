-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		gaps_in = 6,
		gaps_out = 12,

		border_size = 1,

		col = {
			active_border = { colors = { "rgb(555555)" } },
			inactive_border = "rgb(45403d)",
		},
		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,
	},

	decoration = {
		rounding = 10,
		rounding_power = 2,

		-- Change transparency of focused and unfocused windows
		active_opacity = 0.7,
		inactive_opacity = 0.7,
		-- active_opacity = 1,
		-- inactive_opacity = 1,

		shadow = {
			enabled = true,
			range = 20,
			render_power = 3,
			color = 0xee121212,
		},

		-- blur = {
		-- 	enabled = true,
		-- 	size = 20,
		-- 	passes = 3,
		-- 	vibrancy = 0.1696,
		-- },
	},

	animations = {
		enabled = true,
	},
})

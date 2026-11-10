---@diagnostic disable: undefined-global

-- WINDOW RULE
-- Rule to make the rmpc download terminal float and center
hl.window_rule({
	match = { class = "^(rmpc-download)$" },
	float = true,
	size = "900 600",
	center = true,
})

-- Rule to make gmail only appear in special workspace
hl.window_rule({
	match = { class = "brave-mail.google.com__mail_u_1-Default" },
	workspace = "special:gmail",
})

-- Rule to make instagram only appear in special workspace
hl.window_rule({
	match = { class = "brave-instagram.com__-Default" },
	workspace = "special:instagram",
})

-- Rule to make messenger only appear in special workspace
hl.window_rule({
	match = { class = "brave-facebook.com__messages-Default" },
	workspace = "special:messenger",
})

hl.window_rule({
	match = { class = "brave-backiee.com__-Default" },
	workspace = "special:wallhaven",
})

-- Transparent
hl.window_rule({
	match = { class = ".*" },
	opacity = 0.8,
})

-- Focus HJKL
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))

-- Move window HJKL
hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "right" }))

-- Clipboard history wipe with confirm
hl.bind("SUPER + SHIFT + V", hl.dsp.exec_cmd("~/.config/caelestia/scripts/wipe-clipboard.sh"))

-- Browser
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("zen-browser"))

-- Toggle bar
hl.bind("SUPER+ SHIFT + W", hl.dsp.exec_cmd("~/.config/caelestia/scripts/toggle-bar.sh"))

-- APPS
hl.bind("SUPER + A", hl.dsp.exec_cmd("brave-origin --app=https://chat.deepseek.com"))
hl.bind("SUPER + SHIFT + A", hl.dsp.exec_cmd("brave-origin --app=https://chatgpt.com"))

hl.bind("SUPER + SHIFT +G", hl.dsp.exec_cmd("brave-origin --app=https://linkedin.com"))

hl.bind("SUPER + SHIFT +R", hl.dsp.exec_cmd("brave-origin --app=https://monkeytype.com"))

-- SPECIAL WORKSPACE
hl.bind("SUPER + G", function()
	-- Check if there are windows in special:gmail
	local windows = hl.get_workspace_windows("special:gmail")
	if #windows > 0 then
		-- There are windows, just toggle visibility
		hl.dispatch(hl.dsp.workspace.toggle_special("gmail"))
	else
		-- No windows, spawn Gmail and it will be automatically placed by the window rule
		hl.dispatch(hl.dsp.exec_cmd("brave-origin --app=https://mail.google.com/mail/u/1"))
	end
end)

hl.bind("SUPER + I", function()
	-- Check if there are windows in special:instagram
	local windows = hl.get_workspace_windows("special:instagram")
	if #windows > 0 then
		-- There are windows, just toggle visibility
		hl.dispatch(hl.dsp.workspace.toggle_special("instagram"))
	else
		-- No windows, spawn instagram and it will be automatically placed by the window rule
		hl.dispatch(hl.dsp.exec_cmd("brave-origin --app=https://instagram.com"))
	end
end)

hl.bind("SUPER + SHIFT +I", function()
	-- Check if there are windows in special:instagram
	local windows = hl.get_workspace_windows("special:messenger")
	if #windows > 0 then
		-- There are windows, just toggle visibility
		hl.dispatch(hl.dsp.workspace.toggle_special("messenger"))
	else
		-- No windows, spawn instagram and it will be automatically placed by the window rule
		hl.dispatch(hl.dsp.exec_cmd("brave-origin --app=https://facebook.com/messages"))
	end
end)

hl.bind("SUPER + W", function()
	local window = hl.get_workspace_windows("special:wallhaven")
	if #window > 0 then
		hl.dispatch(hl.dsp.workspace.toggle_special("wallhaven"))
	else
		hl.dispatch(hl.dsp.exec_cmd("brave-origin --app=https://backiee.com"))
	end
end)

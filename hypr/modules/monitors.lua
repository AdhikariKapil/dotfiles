------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- hl.monitor({
--     output   = "eDP-1",
--     mode     = "1920x1080@144",
--     position = "1920x0",
--     scale    = "1.25",
-- })

hl.monitor({
	output = "eDP-1",
	disabled = true,
})

hl.monitor({
	output = "HDMI-A-2",
	mode = "1920x1080@143.95",
	position = "0x0",
	scale = "1",
})

---- Workspace 1-5 on my monitor ----
hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-2", persistent = true })
hl.workspace_rule({ workspace = "2", monitor = "HDMI-A-2", persistent = true })
hl.workspace_rule({ workspace = "3", monitor = "HDMI-A-2", persistent = true })
hl.workspace_rule({ workspace = "4", monitor = "HDMI-A-2", persistent = true })
hl.workspace_rule({ workspace = "5", monitor = "HDMI-A-2", persistent = true })

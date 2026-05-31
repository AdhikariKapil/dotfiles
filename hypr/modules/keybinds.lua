---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use

local terminal = "wezterm"
local alt_terminal = "kitty"
local fileManager = "nautilus"
local menu = "rofi -show drun"

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more

-- Terminal
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. "+ SHIFT + Return", hl.dsp.exec_cmd(alt_terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())

-- Browser
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("zen-browser"))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("brave --app=https://chat.deepseek.com"))

-- Logout
hl.bind(
	mainMod .. " + Delete",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("wlogout"))

-- Monitor Toggle
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-monitor.sh"))

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. "+ SHIFT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + U", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + SHIFT +  J", hl.dsp.layout("togglesplit")) -- dwindle only

-- Rofi
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("rofimoji --action menu"))
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd("rofimoji --action copy"))

-- FullScreen & Maximized
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ "fullscreen", "toggle" }))

-- Swap
hl.bind(mainMod .. " + SHIFT + K ", hl.dsp.window.swap({ next = "left" }))

-- Waybar
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("/home/whothis/.config/waybar/scripts/launch.sh"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"), { description = "Toggle Waybar" })
hl.bind(
	mainMod .. " + SHIFT + T",
	hl.dsp.exec_cmd("~/.config/waybar/scripts/width-toggle.sh"),
	{ description = "Toggle Size" }
)

-- Swaync
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("swaync-client -t"), { description = "Toggle Swaync" })

-- Clipboard History
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("~/.config/hypr/scripts/clipboard-pick.sh"))
hl.bind(mainMod .. "+ SHIFT + V", hl.dsp.exec_cmd("~/.config/hypr/scripts/clipboard-clear.sh"))

-- Theme and Wallpaper Picker
hl.bind(mainMod .. "+ SHIFT + W", hl.dsp.exec_cmd("theme-switch.sh"))
hl.bind(mainMod .. "+ W", hl.dsp.exec_cmd("wallpaper-pick.sh"))

-- Hyprlock
hl.bind(mainMod .. "+ SHIFT + L", hl.dsp.exec_cmd("hyprlock"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- screenshots
-- bind = $mainMod, P, exec, grimblast save screen
-- bind = $mainMod ALT, P, exec, sleep 5 && grimblast save screen
-- bind = $mainMod CTRL, P, exec, grimblast --cursor save screen
-- bind = $mainMod SHIFT, P, exec, grimblast save area
--
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("grimblast save screen && notify-send '󰹑 Screenshot saved ✅'"))
hl.bind(
	mainMod .. " + ALT + P",
	hl.dsp.exec_cmd("sleep 5 && grimblast save screen && notify-send '󰹑 Screenshot saved ✅'")
)
hl.bind(
	mainMod .. " + CTRL + P",
	hl.dsp.exec_cmd("grimblast --cursor save screen && notify-send '󰹑 Screenshot saved ✅'")
)
hl.bind(mainMod .. " + SHIFT + p", hl.dsp.exec_cmd("grimblast save area && notify-send '󰹑 Screenshot saved ✅' "))

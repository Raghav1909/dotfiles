local wezterm = require("wezterm")
local config = {}

-- Set preferred font
config.font = wezterm.font("JetBrains Mono")
config.font_size = 12

-- Enable Wayland
config.enable_wayland = true

-- Set preferred color scheme
config.color_scheme = "Oxocarbon Dark"

-- Disable the fancy tab bar
config.use_fancy_tab_bar = false

-- Disable tab bar
config.enable_tab_bar = false

-- Key binding to toggle fullscreen
config.keys = {
	{
		key = "n",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

-- -- Maximize window on startup
-- wezterm.on("gui-startup", function()
-- 	local mux = wezterm.mux
-- 	local tab, pane, window = mux.spawn_window({})
-- 	window:gui_window():maximize()
-- end)

-- Maximize window on startup
wezterm.on("gui-startup", function()
	local mux = wezterm.mux
	local tab, pane, window = mux.spawn_window(cmd or {})
	local gui_window = window:gui_window()
	gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
end)

-- Set the path to your background image
config.window_background_image = wezterm.home_dir .. "/.config/wezterm/assets/house_md_wallpaper.jpg"

-- Set the background image opacity (0.0 - fully transparent, 1.0 - fully opaque)
config.window_background_opacity = 1.0

-- Configure how the background image is displayed
config.window_background_image_hsb = {
	brightness = 0.05, -- Adjust the brightness of the background image
	hue = 1.0, -- Adjust the hue of the background image
	saturation = 1.0, -- Adjust the saturation of the background image
}

return config

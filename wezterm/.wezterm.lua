local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- keys
local act = wezterm.action

config.keys = {
	-- paste from the clipboard
	{ key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },
}

-- terminal appearance
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9
config.enable_tab_bar = false
config.font = wezterm.font("MonaspiceNe Nerd Font")
config.harfbuzz_features = { "ss01", "ss02", "ss03", "ss04", "ss05", "ss06", "ss07", "ss08", "calt", "dlig" }

return config

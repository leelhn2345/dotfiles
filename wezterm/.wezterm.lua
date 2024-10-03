local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- core settings
-- config.default_domain = "WSL:Ubuntu" -- uncomment if using WSL
-- config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9
config.window_padding = {
	bottom = 0,
	right = 0,
}
config.font_size = 18
config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font_with_fallback({
	"MonaspiceNe Nerd Font",
	"Monaspace Neon",
	"Cascadia Code",
})
config.harfbuzz_features = {
	"ss03",
	"ss02",
	"ss03",
	"ss04",
	"ss05",
	"ss06",
	"ss07",
	"ss08",
	"calt",
	"dlig",
}

-- keys
local act = wezterm.action

config.keys = {
	-- paste from the clipboard
	{ key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },
}

return config

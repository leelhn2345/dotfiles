local wezterm = require("wezterm")

-- change appearance on lost focus
wezterm.on("update-status", function(window, _)
	local overrides = window:get_config_overrides() or {}
	if window:is_focused() then
		overrides.color_scheme = nil
	else
		overrides.color_scheme = "nightfox"
	end
	window:set_config_overrides(overrides)
end)

local config = wezterm.config_builder()
local act = wezterm.action

config = {
	-- core settings
	window_close_confirmation = "NeverPrompt",
	-- default_domain = "WSL:Ubuntu" -- uncomment if using WSL

	-- appearance
	native_macos_fullscreen_mode = true, -- only has an effect when running on macOS
	window_decorations = "RESIZE",
	window_background_opacity = 0.9,
	window_padding = {
		bottom = 0,
		right = 0,
	},
	font_size = 18,
	hide_tab_bar_if_only_one_tab = true,
	font = wezterm.font_with_fallback({
		"MonaspiceNe Nerd Font",
		"Monaspace Neon",
		"Cascadia Code",
	}),
	harfbuzz_features = {
		"calt",
		"ss01",
		"ss02",
		"ss03",
		"ss04",
		"ss05",
		"ss06",
		"ss07",
		"ss08",
		"ss09",
		"liga",
	},

	keys = {
		-- paste from the clipboard
		{ key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },
	},
}

return config

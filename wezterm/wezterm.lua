local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.enable_tab_bar = false

-- config.color_scheme = "nightfox"
config.colors = {
	background = "#1f1f24",
	cursor_bg = "#3088f1",
}

config.font = wezterm.font("Monaspace Neon", { weight = "Medium" })

config.keys = {
	{ mods = "OPT", key = "LeftArrow", action = wezterm.action.SendKey({ mods = "ALT", key = "b" }) },
	{ mods = "OPT", key = "RightArrow", action = wezterm.action.SendKey({ mods = "ALT", key = "f" }) },
	{ mods = "CMD", key = "LeftArrow", action = wezterm.action.SendKey({ mods = "CTRL", key = "a" }) },
	{ mods = "CMD", key = "RightArrow", action = wezterm.action.SendKey({ mods = "CTRL", key = "e" }) },
	{ mods = "CMD", key = "Backspace", action = wezterm.action.SendKey({ mods = "CTRL", key = "u" }) },
}

config.hyperlink_rules = wezterm.default_hyperlink_rules()

return config

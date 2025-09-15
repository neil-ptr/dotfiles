local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.enable_tab_bar = false

-- config.colors = {
-- 	background = "#292a30",
-- 	cursor_bg = "#3088f1",
-- }

config.colors = {
	foreground = "#dfdfe0",
	background = "#292a30",

	cursor_bg = "#3088f1",
	cursor_border = "#3088f1",
	cursor_fg = "#292a30",

	selection_bg = "#414453",
	selection_fg = "#dfdfe0",

	ansi = {
		"#393b44", -- black
		"#ff8170", -- red
		"#84b360", -- green
		"#d9c97c", -- yellow
		"#4eb0cc", -- blue
		"#b281eb", -- magenta
		"#78c2b3", -- cyan
		"#a3b1bf", -- white
	},
	brights = {
		"#53606e", -- bright black
		"#ff7ab2", -- bright red
		"#b0e687", -- bright green
		"#fef937", -- bright yellow
		"#6bdfff", -- bright blue
		"#dabaff", -- bright magenta
		"#acf2e4", -- bright cyan
		"#dfdfe0", -- bright white
	},

	tab_bar = {
		background = "#2f3037",
		active_tab = {
			bg_color = "#414453",
			fg_color = "#dfdfe0",
		},
		inactive_tab = {
			bg_color = "#2f3037",
			fg_color = "#7f8c98",
		},
		inactive_tab_hover = {
			bg_color = "#393b44",
			fg_color = "#a3b1bf",
		},
		new_tab = {
			bg_color = "#2f3037",
			fg_color = "#7f8c98",
		},
		new_tab_hover = {
			bg_color = "#393b44",
			fg_color = "#a3b1bf",
		},
	},
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

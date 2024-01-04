local wezterm = require("wezterm")

return {
	enable_tab_bar = false,
	font_size = 18.0,
	font = wezterm.font("Berkeley Mono"),
	color_scheme = "Kanagawa (Gogh)",
	enable_scroll_bar = false,
	scrollback_lines = 10500,
	min_scroll_bar_height = "1cell",
	window_decorations = "RESIZE"
}

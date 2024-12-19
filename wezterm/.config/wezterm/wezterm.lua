local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local colors = {
  -- Default colors
  foreground = "#D1D3D6", -- white
  background = "#1A1D21", -- black
  cursor_bg = "#D1D3D6",
  cursor_border = "#D1D3D6",
  cursor_fg = "#1A1D21",
  selection_bg = "#363A3F",
  selection_fg = "#D1D3D6",

  -- ANSI colors
  ansi = {
    "#1A1D21", -- black
    "#E8525C", -- red
    "#66C489", -- green
    "#ECB222", -- yellow
    "#59A4F8", -- blue
    "#DD7FE6", -- magenta
    "#5DB0D7", -- cyan
    "#D1D3D6", -- white
  },

  -- Bright ANSI colors
  brights = {
    "#616061", -- bright black
    "#F37067", -- bright red
    "#85D394", -- bright green
    "#F6B73C", -- bright yellow
    "#6AB4F8", -- bright blue
    "#E68FEF", -- bright magenta
    "#67C7E2", -- bright cyan
    "#FFFFFF", -- bright white
  },

  -- Tab bar colors
  tab_bar = {
    background = "#1A1D21",
    active_tab = {
      bg_color = "#2B2E33",
      fg_color = "#D1D3D6",
    },
    inactive_tab = {
      bg_color = "#1A1D21",
      fg_color = "#616061",
    },
    inactive_tab_hover = {
      bg_color = "#222529",
      fg_color = "#D1D3D6",
    },
    new_tab = {
      bg_color = "#1A1D21",
      fg_color = "#616061",
    },
    new_tab_hover = {
      bg_color = "#222529",
      fg_color = "#D1D3D6",
    },
  },
}

return {
	adjust_window_size_when_changing_font_size = false,
	initial_rows = 30,
	initial_cols = 150,
	enable_tab_bar = false,
	font = wezterm.font 'GitLab Mono',
	colors = colors,
	window_padding = {
		left = 16,
		right = 16,
		top = 16,
		bottom = 16,
	}
}



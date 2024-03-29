local wezterm = require 'wezterm'

local config = wezterm.config_builder()
config.font = wezterm.font 'Iosevka Term'
config.color_scheme = 'AdventureTime'
config.font_size = 22.0
config.enable_tab_bar = false
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0, }
config.colors = {
  foreground = '#dadada',
  background = '#111111',
  cursor_bg = '#ffd800',
  cursor_fg = '#000000',
  cursor_border = '#ffd800',
  selection_fg = 'black',
  selection_bg = 'white',
  -- scrollbar_thumb = '#222222', -- TODO
  -- split = '#444444', -- TODO
  ansi = {
    '#111111', -- Black
    '#fd5e00', -- Red
    '#00875f', -- Green
    '#ffd800', -- Yellow
    '#005faf', -- Blue
    '#870087', -- Magenta
    '#00605f', -- Cyan
    '#9e9e9e' -- White
  },
  brights = {
   '#3a3a3a', -- Bright black
   '#ff875f', -- Bright red
   '#01af87', -- Bright green
   '#ffff5f', -- Bright yellow
   '#01afff', -- Bright blue
   '#875faf', -- Bright magenta
   '#008787', -- Bright cyan
   '#dadada', -- Bright white
  }
}

return config

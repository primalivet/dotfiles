local wezterm = require("wezterm")
-- local wezdir = os.getenv("HOME") .. ".config/wezterm"
local appearance = wezterm.gui.get_appearance()

local config = {
  enable_tab_bar = false,
  adjust_window_size_when_changing_font_size = false,
  window_close_confirmation = 'NeverPrompt',
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  font = wezterm.font("Iosevka Term", { weight = "Regular" }),
  font_size = 20,
}

if appearance:find("Dark") then
  config.window_background_opacity = 0.8
  config.color_scheme = "Builtin Tango Dark"
else
  config.color_scheme = "Builtin Tango Light"
  config.window_background_opacity = 0.9
end

return config

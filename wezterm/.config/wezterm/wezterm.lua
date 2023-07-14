local gettit = {
  background = "#ededed",
  foreground = "#232323",
  selection_fg = "none",
  selection_bg = "#ffffdd",
  ansi = {
    "#000000",
    "#660000",
    "#006600",
    "#666600",
    "#000066",
    "#660066",
    "#006666",
    "#dddddd",
  },
  brights = {
    "#999999",
    "#910000",
    "#009000",
    "#909000",
    "#0000aa",
    "#900090",
    "#009090",
    "#ffffff",
  },
}

local wezterm = require("wezterm")
local wezdir = os.getenv("HOME") .. ".config/wezterm"
local appearance = wezterm.gui.get_appearance()

local config = {
  enable_tab_bar = false,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
  font = wezterm.font("Iosevka Term", { weight = "Regular" }),
  font_size = 20,
}

if not appearance:find("Dark") then
  config.colors = gettit
end

return config

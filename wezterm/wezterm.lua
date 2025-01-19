local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'rose-pine-moon'

config.font = wezterm.font('JetBrains Mono', { weight = 'DemiBold' })
config.font_size = 22
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

local act = wezterm.action

config.keys = {
  {
    key = 'LeftArrow',
    mods = 'OPT',
    action = act.SendKey { key = 'b', mods = 'ALT' },
  },
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = act.SendKey { key = 'f', mods = 'ALT' },
  },
  {
    key = 'LeftArrow',
    mods = 'CMD',
    action = act.SendKey { key = 'a', mods = 'CTRL' },
  },
  {
    key = 'RightArrow',
    mods = 'CMD',
    action = act.SendKey { key = 'e', mods = 'CTRL' },
  },
  {
    key = 'Backspace',
    mods = 'CMD',
    action = act.SendKey { key = 'u', mods = 'CTRL' }
  },
}

return config

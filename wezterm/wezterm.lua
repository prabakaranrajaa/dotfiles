local wezterm = require 'wezterm'
return {
--default_prog = { "/usr/bin/tmux", "attach-session", "-t", "dev" }, -- Replace "default" with your session name

  adjust_window_size_when_changing_font_size = false,
  color_scheme = 'Builtin Tango Dark',
  --color_scheme = 'termnial.sexy',
  --color_scheme = 'Catppuccin Mocha',
  enable_tab_bar = false,
  font_size = 11.0,
  --font = wezterm.font('JetBrainsMono Nerd Font'),
  font = wezterm.font_with_fallback({
    "JetBrainsMono Nerd Font",   -- Main font
    "Noto Color Emoji",          -- Fallback for emojis
    "Roboto",                    -- Additional fallback
  }),
  
  --   🎉 💻 ✨ 🌐
  
  -- macos_window_background_blur = 40,
  -- macos_window_background_blur = 30,
  default_cursor_style = "BlinkingBlock", -- Sets the cursor to a blinking block
  cursor_blink_rate = 800,               -- Sets the blink rate in milliseconds (adjust as needed)

  -- window_background_image = '/Users/omerhamerman/Downloads/3840x1080-Wallpaper-041.jpg',
  -- window_background_image_hsb = {
  -- 	brightness = 0.01,
  -- 	hue = 1.0,
  -- 	saturation = 0.5,
  -- },
  window_background_opacity = 0.92,
  --window_background_opacity = 1.0,
  -- window_background_opacity = 0.78,
  -- window_background_opacity = 0.20,
  -- text_background_opacity = 1.0, -- Keep text fully visible
  window_decorations = 'RESIZE',
  keys = {
    {
      key = 'q',
      mods = 'CTRL',
      action = wezterm.action.ToggleFullScreen,
    },
    {
      key = '\'',
      mods = 'CTRL',
      action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
    },
  },
  mouse_bindings = {
    -- Ctrl-click will open the link under the mouse cursor
    {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = wezterm.action.OpenLinkAtMouseCursor,
    },
  },
}

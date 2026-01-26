local wezterm = require("wezterm")

function apply_settings(config)
  ---
  -- Color scheme.
  ---
  config.color_scheme = "Catppuccin Mocha"

  ---
  -- Renderer options.
  ---
  -- WebGpu uses Metal instead of plain OpenGL.
  config.front_end = "WebGpu"
  config.max_fps = 30

  ---
  -- Cursor options.
  ---
  config.default_cursor_style = "BlinkingBar"
  config.cursor_blink_ease_in = "Constant"
  config.cursor_blink_ease_out = "Constant"
  config.cursor_blink_rate = 600

  ---
  -- Window options.
  ---
  config.initial_cols = 120
  config.initial_rows = 40
  config.scrollback_lines = 100000
  config.window_close_confirmation = "NeverPrompt"
  config.window_decorations = "RESIZE"
  config.window_padding = {
    left = 15,
    right = 15,
    top = 15,
    bottom = 15,
  }

  ---
  -- Tab bar options
  ---
  config.hide_tab_bar_if_only_one_tab = true
  config.show_new_tab_button_in_tab_bar = false
  config.tab_max_width = 32
  config.use_fancy_tab_bar = false

  -- This *requires* color_scheme to have already been set.
  local colorscheme = wezterm.color.get_builtin_schemes()[config.color_scheme]
  config.colors = {
    tab_bar = {
      background = wezterm.color.parse(colorscheme.background):darken(0.2),
      active_tab = {
        bg_color = colorscheme.background,
        fg_color = colorscheme.foreground,
      },
      inactive_tab = {
        bg_color = wezterm.color.parse(colorscheme.background):darken(0.2),
        fg_color = colorscheme.foreground,
      },
      inactive_tab_hover = {
        bg_color = wezterm.color.parse(colorscheme.background):lighten(0.08),
        fg_color = colorscheme.foreground,
      },
    },
  }

  ---
  -- Text options.
  ---
  config.font = wezterm.font("Berkeley Mono")
  config.font_size = 15
  config.line_height = 1.5
  config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
  -- Makes font rendering look a little more macOS-like.
  config.freetype_load_target = "Light"

  ---
  -- Disable default key/mouse bindings
  ---
  config.disable_default_mouse_bindings = true
  config.disable_default_key_bindings = true
end

function setup_mouse_bindings(config)
  config.mouse_bindings = {
    {
      event = { Down = { streak = 1, button = "Left" } },
      mods = "NONE",
      action = wezterm.action.SelectTextAtMouseCursor("Cell"),
    },
    {
      event = { Drag = { streak = 1, button = "Left" } },
      mods = "NONE",
      action = wezterm.action.ExtendSelectionToMouseCursor("Cell"),
    },
    {
      event = { Drag = { streak = 1, button = "Left" } },
      mods = "SHIFT",
      action = wezterm.action.ExtendSelectionToMouseCursor("Cell"),
    },
    {
      event = { Drag = { streak = 1, button = "Left" } },
      mods = "ALT",
      action = wezterm.action.ExtendSelectionToMouseCursor("Block"),
    },
    {
      event = { Down = { streak = 1, button = "Left" } },
      mods = "SHIFT",
      action = wezterm.action.ExtendSelectionToMouseCursor("Cell"),
    },
    {
      event = { Down = { streak = 1, button = "Left" } },
      mods = "ALT",
      action = wezterm.action.ExtendSelectionToMouseCursor("Block"),
    },
    {
      event = { Down = { streak = 1, button = "Left" } },
      mods = "CTRL",
      action = wezterm.action.OpenLinkAtMouseCursor,
    },
    {
      event = { Down = { streak = 2, button = "Left" } },
      mods = "NONE",
      action = wezterm.action.SelectTextAtMouseCursor("Word"),
    },
    {
      event = { Down = { streak = 3, button = "Left" } },
      mods = "NONE",
      action = wezterm.action.SelectTextAtMouseCursor("Line"),
    },
    {
      event = { Down = { streak = 1, button = "Middle" } },
      mods = "NONE",
      action = wezterm.action.PasteFrom("Clipboard"),
    },
    {
      event = { Down = { streak = 1, button = { WheelUp = 1 } } },
      mods = "NONE",
      action = wezterm.action.ScrollByCurrentEventWheelDelta,
    },
    {
      event = { Down = { streak = 1, button = { WheelDown = 1 } } },
      mods = "NONE",
      action = wezterm.action.ScrollByCurrentEventWheelDelta,
    },
  }
end

function setup_common_key_bindings(config)
  config.keys = {
    { key = "+", mods = "SUPER", action = wezterm.action.IncreaseFontSize },
    { key = "-", mods = "SUPER", action = wezterm.action.DecreaseFontSize },
    { key = "0", mods = "SUPER", action = wezterm.action.ResetFontSize },
    { key = "H", mods = "CTRL", action = wezterm.action.HideApplication },
    { key = "L", mods = "SHIFT|CTRL", action = wezterm.action.ShowDebugOverlay },
    { key = "l", mods = "SHIFT|CTRL", action = wezterm.action.ShowDebugOverlay },
    { key = "c", mods = "SUPER", action = wezterm.action.CopyTo("Clipboard") },
    { key = "f", mods = "SUPER", action = wezterm.action.Search("CurrentSelectionOrEmptyString") },
    { key = "h", mods = "SUPER", action = wezterm.action.HideApplication },
    { key = "m", mods = "SUPER", action = wezterm.action.Hide },
    { key = "n", mods = "SUPER", action = wezterm.action.SpawnWindow },
    { key = "q", mods = "SUPER", action = wezterm.action.QuitApplication },
    { key = "v", mods = "SUPER", action = wezterm.action.PasteFrom("Clipboard") },
    { key = "w", mods = "SUPER", action = wezterm.action.CloseCurrentPane({ confirm = false }) },

    { key = "PageUp", mods = "SHIFT", action = wezterm.action.ScrollByPage(-1) },
    { key = "PageDown", mods = "SHIFT", action = wezterm.action.ScrollByPage(1) },
  }
end

function setup_additional_split_key_bindings(config)
  local extraKeys = {
    { key = "t", mods = "SUPER|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    {
      key = "t",
      mods = "SUPER|SHIFT|ALT",
      action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
    },

    { key = "LeftArrow", mods = "SHIFT", action = wezterm.action.ActivatePaneDirection("Left") },
    { key = "RightArrow", mods = "SHIFT", action = wezterm.action.ActivatePaneDirection("Right") },
    { key = "UpArrow", mods = "SHIFT", action = wezterm.action.ActivatePaneDirection("Up") },
    { key = "DownArrow", mods = "SHIFT", action = wezterm.action.ActivatePaneDirection("Down") },

    { key = "LeftArrow", mods = "SHIFT|CTRL", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
    { key = "RightArrow", mods = "SHIFT|CTRL", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
    { key = "UpArrow", mods = "SHIFT|CTRL", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
    { key = "DownArrow", mods = "SHIFT|CTRL", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
  }

  for _, v in pairs(extraKeys) do
    table.insert(config.keys, v)
  end
end

function setup_additional_tab_key_bindings(config)
  local extraKeys = {
    { key = "t", mods = "SUPER", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
    { key = "[", mods = "SUPER", action = wezterm.action.ActivateTabRelative(-1) },
    { key = "]", mods = "SUPER", action = wezterm.action.ActivateTabRelative(1) },
    { key = "1", mods = "SUPER", action = wezterm.action.ActivateTab(0) },
    { key = "2", mods = "SUPER", action = wezterm.action.ActivateTab(1) },
    { key = "3", mods = "SUPER", action = wezterm.action.ActivateTab(2) },
    { key = "4", mods = "SUPER", action = wezterm.action.ActivateTab(3) },
    { key = "5", mods = "SUPER", action = wezterm.action.ActivateTab(4) },
    { key = "6", mods = "SUPER", action = wezterm.action.ActivateTab(5) },
    { key = "7", mods = "SUPER", action = wezterm.action.ActivateTab(6) },
    { key = "8", mods = "SUPER", action = wezterm.action.ActivateTab(7) },
    { key = "w", mods = "SUPER|SHIFT", action = wezterm.action.CloseCurrentTab({ confirm = false }) },
  }

  for _, v in pairs(extraKeys) do
    table.insert(config.keys, v)
  end
end

--------------------------------------------------------------------------------

local is_ast = not not os.getenv("WEZTERM_IS_AST")

-- Setup all common settings.
local config = {}
apply_settings(config)
setup_mouse_bindings(config)
setup_common_key_bindings(config)

-- If this is not an ast, setup additional key bindings for splits and tabs.
if not is_ast then
  setup_additional_split_key_bindings(config)
  setup_additional_tab_key_bindings(config)
end

-- If this *is* an ast, run the requested command instead of $SHELL.
if is_ast and not not os.getenv("WEZTERM_AST_COMMAND") then
  config.default_prog = { os.getenv("SHELL"), "-c", os.getenv("WEZTERM_AST_COMMAND") }
end

return config

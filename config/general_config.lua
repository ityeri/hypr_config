hl.config({
  general = {
    resize_on_border = true,
    -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
    allow_tearing = false
  },
  -- Enabling xwayland
  xwayland = {
    enabled = true
  },
  dwindle = {
    -- pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = true -- You probably want this
  },
  master = {
    new_status = "master"
  },
  misc = {
    force_default_wallpaper = -1,  -- Set to 0 or 1 to disable the anime mascot wallpapers
    disable_hyprland_logo   = true -- If true disables the random hyprland logo / anime girl background. :(
  },
  input = {
    kb_layout    = "us",
    kb_variant   = "",
    kb_model     = "",
    kb_options   = "",
    kb_rules     = "",

    follow_mouse = 1,

    sensitivity  = 0, -- -1.0 - 1.0, 0 means no modification.

    repeat_delay = 200,
    repeat_rate  = 60,

    touchpad     = {
      natural_scroll = false
    }
  }
})

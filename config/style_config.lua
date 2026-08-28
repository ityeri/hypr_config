hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 5,
    border_size = 2,

    col = {
      active_border = {
        colors = {
          "rgb(f08080)",
          "rgb(f4978e)",
          "rgb(f8ad9d)",
          "rgb(fbc4ab)",
          "rgb(ffdab9)"
        },
        angle = 45
      },
      inactive_border = "rgba(595959aa)"
    },

    layout = "dwindle"
  },

  -- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
  decoration = {
    rounding = 10,
    rounding_power = 2,

    -- Change transparency of focused and unfocused windows
    active_opacity = 1.0,
    inactive_opacity = 1.0,

    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = 0xee1a1a1a
    },

    -- https://wiki.hypr.land/Configuring/Basics/Variables/#blur
    blur = {
      enabled = true,
      size = 3,
      passes = 1,
      vibrancy = 0.1696
    }
  },
  animations = {
    enabled = true -- original: "yes, please :)"
  }
})

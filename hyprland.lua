-- TODO what is "Smart gaps" feature?

require("monitors")
require("config.general_config")
require("config.style_config")
require("animations")
require("keymap")

-- Std programs (variable)
hl.on("hyprland.start", function()
  hl.exec_cmd("hyprpaper")
  hl.exec_cmd("kime")
  hl.exec_cmd("easyeffects --gapplication-service")
end)

-- Env vars
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("XCURSOR_SIZE", "30")
hl.env("HYPRCURSOR_SIZE", "30")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures
hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
  name = "epic-mouse-v1",
  sensitivity = -0.5
})

hl.on(
  "hyprland.start",
  function()
    hl.dispatch(hl.dsp.focus({ workspace = 2 }))

    hl.timer(
      function()
        local m = hl.get_active_monitor()
        if m then
          hl.dispatch(hl.dsp.cursor.move({
            x = m.x + m.width / m.scale / 2,
            y = m.y + m.height / m.scale / 2
          }))
        end
      end,
      { timeout = 20, type = "oneshot" }
    )
  end
)

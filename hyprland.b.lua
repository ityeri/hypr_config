
-- #######################################################################################
-- HYPRLAND CONFIG (Lua).
-- Converted from hyprlang (hyprland.conf) -> Lua (hyprland.lua), for Hyprland 0.55+
-- https://wiki.hypr.land/Configuring/Start/
-- #######################################################################################


-- You can split this configuration into multiple files
-- Create your files separately and then require them like this:
-- NOTE: the old monitors.conf (hyprlang) must be converted to monitors.lua first.

-- ################
-- ### MONITORS ###
-- ################
--

hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@100.0",
    position = "840x312",
    scale    = 1.0,
})
hl.monitor({
    output    = "HDMI-A-1",
    transform = 1, -- 90 degrees (rotated)
})
hl.monitor({
    output   = "DP-1",
    mode     = "2560x1080@144.0",
    position = "1920x426",
    scale    = 1.0,
})
hl.monitor({
    output   = "DP-2",
    mode     = "2560x1440@60.0",
    position = "1920x1506",
    scale    = 2.13,
})

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

-- unscale XWayland
hl.config({
    xwayland = {
        enabled = true,
    },
})


-- ###################
-- ### MY PROGRAMS ###
-- ###################

-- See https://wiki.hypr.land/Configuring/Basics/Variables/

-- Set programs that you use
-- This variables only using for keybindings
-- This variables not inject to de or desktop portal
local terminal    = "alacritty"
local fileManager = "nautilus -w"
-- local menu = "hyprlauncher"


-- #################
-- ### AUTOSTART ###
-- #################

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

-- hl.on("hyprland.start", function()
--     hl.exec_cmd(terminal)
--     hl.exec_cmd("nm-applet")
--     hl.exec_cmd("waybar & hyprpaper & firefox")
-- end)

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("kime")
    hl.exec_cmd("easyeffects --gapplication-service")
end)


-- #############################
-- ### ENVIRONMENT VARIABLES ###
-- #############################

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("XCURSOR_SIZE", "30")
hl.env("HYPRCURSOR_SIZE", "30")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")


-- ###################
-- ### PERMISSIONS ###
-- ###################

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-- #####################
-- ### LOOK AND FEEL ###
-- #####################

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/

-- https://wiki.hypr.land/Configuring/Basics/Variables/#general
hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 5,

        border_size = 2,

        -- https://wiki.hypr.land/Configuring/Basics/Variables/#variable-types for info about colors
        col = {
            active_border   = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    -- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
    decoration = {
        rounding       = 10,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        -- https://wiki.hypr.land/Configuring/Basics/Variables/#blur
        blur = {
            enabled  = true,
            size     = 3,
            passes   = 1,
            vibrancy = 0.1696,
        },
    },

    -- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
    animations = {
        enabled = true, -- original: "yes, please :)"
    },
})

-- Default curves, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/#curves
--        NAME,           X0,   Y0,   X1,   Y1
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
--           NAME,          ONOFF, SPEED, CURVE,        [STYLE]
hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        -- pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- https://wiki.hypr.land/Configuring/Basics/Variables/#misc
hl.config({
    misc = {
        force_default_wallpaper = -1,  -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
})


-- #############
-- ### INPUT ###
-- #############

-- https://wiki.hypr.land/Configuring/Basics/Variables/#input
hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        repeat_delay = 200,
        repeat_rate  = 60,

        touchpad = {
            natural_scroll = false,
        },
    },
})

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures
hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


-- ###################
-- ### KEYBINDINGS ###
-- ###################

-- See https://wiki.hypr.land/Configuring/Basics/Binds/
local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
-- hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
-- hl.bind(mainMod .. " + P", hl.dsp.window.pseudo()) -- dwindle
-- hl.bind(mainMod .. " + S", hl.dsp.layout("togglesplit")) -- dwindle
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("ulauncher"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("firefox"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move focus window
hl.bind(mainMod .. " + ALT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + ALT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + ALT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + ALT + J", hl.dsp.window.move({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
end

-- Move active window to a workspace with mainMod + ALT + [-1-9]
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + ALT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Resize windows with key
hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.resize({ x = -20, y = 0, relative = true }))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.resize({ x = 20,  y = 0, relative = true }))
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.resize({ x = 0,   y = -20, relative = true }))
hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.resize({ x = 0,   y = 20,  relative = true }))

-- 그거 그거 극 모니터 3등분용 하드코딩
hl.bind(mainMod .. " + ALT + I", hl.dsp.window.resize({ x = -426, y = 0, relative = true }))
hl.bind(mainMod .. " + ALT + O", hl.dsp.window.resize({ x = 426,  y = 0, relative = true }))

-- screenshot
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

-- mouse bind: drag to move window
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })

-- Workspace shifting
hl.bind(mainMod .. " + CTRL + ALT + L", hl.dsp.workspace.move({ monitor = "right" }))
hl.bind(mainMod .. " + CTRL + ALT + J", hl.dsp.workspace.move({ monitor = "down" }))
hl.bind(mainMod .. " + CTRL + ALT + K", hl.dsp.workspace.move({ monitor = "up" }))
hl.bind(mainMod .. " + CTRL + ALT + H", hl.dsp.workspace.move({ monitor = "left" }))


-- ##############################
-- ### WINDOWS AND WORKSPACES ###
-- ##############################

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/ for more
-- See https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/ for workspace rules

-- Example windowrules that are useful

-- hl.window_rule({
--     name  = "steam-tile",
--     match = { class = "^(steam_app_977950)$" },
--     tile  = true,
-- })
-- hl.window_rule({
--     name     = "steam-minsize",
--     match    = { class = "^(steam_app_977950)$" },
--     min_size = { 1, 1 }, -- dynamic effect
-- })

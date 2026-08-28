local constants = require("constants")

local mainMod = "SUPER"

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(constants.terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M",
  hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(constants.fileManager))
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
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.resize({ x = 20, y = 0, relative = true }))
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.resize({ x = 0, y = -20, relative = true }))
hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.resize({ x = 0, y = 20, relative = true }))

-- 그거 그거 극 모니터 3등분용 하드코딩
hl.bind(mainMod .. " + ALT + I", hl.dsp.window.resize({ x = -426, y = 0, relative = true }))
hl.bind(mainMod .. " + ALT + O", hl.dsp.window.resize({ x = 426, y = 0, relative = true }))

-- screenshot
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

-- mouse bind: drag to move window
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })

-- Workspace shifting
hl.bind(mainMod .. " + CTRL + ALT + L", hl.dsp.workspace.move({ monitor = "right" }))
hl.bind(mainMod .. " + CTRL + ALT + J", hl.dsp.workspace.move({ monitor = "down" }))
hl.bind(mainMod .. " + CTRL + ALT + K", hl.dsp.workspace.move({ monitor = "up" }))
hl.bind(mainMod .. " + CTRL + ALT + H", hl.dsp.workspace.move({ monitor = "left" }))

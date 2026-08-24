-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

local omarchy_gdk_scale = 2
local omarchy_monitor_scale = 2

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = omarchy_monitor_scale })

-- Dell AW3423DW: primary docked display, positioned above the laptop.
-- Match its hardware description so this survives switching video ports.
hl.monitor({ output = "desc:Dell Inc. Dell AW3423DW", mode = "3440x1440@99.98", position = "0x0", scale = 1 })

-- Center the 1440-logical-pixel-wide laptop below the 3440-pixel-wide Dell.
hl.monitor({ output = "eDP-1", mode = "2880x1800@60", position = "1000x1440", scale = 2 })

-- Treat the Dell as primary whenever it is present. Workspace rules are
-- preferable to an event watcher: Hyprland reapplies them during hotplug and
-- falls back to the laptop automatically while the Dell is disconnected.
for workspace = 1, 10 do
  hl.workspace_rule({
    workspace = tostring(workspace),
    monitor = "desc:Dell Inc. Dell AW3423DW",
  })
end

-- Keep the Elgato Prompter physically to the left of the XDR.
-- hl.monitor({ output = "DP-1", mode = "6016x3384@60", position = "0x0", scale = 2 })
hl.monitor({ output = "DVI-I-1", mode = "1024x600@60.11", position = "-1024x200", scale = 1 })

-- Configure a specific monitor.
-- hl.monitor({ output = "DP-2", mode = "2560x1440@144", position = "0x0", scale = 1 })

-- Portrait/rotated secondary monitor (transform: 1 = 90°, 3 = 270°).
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })

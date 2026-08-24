-- Learn how to configure Hyprland: https://wiki.hypr.land/Configuring/Start/

-- Omarchy's bootstrap keeps path setup out of this user config.
dofile((os.getenv("OMARCHY_PATH") or "/usr/share/omarchy") .. "/default/hypr/bootstrap.lua")

-- Disable all Omarchy default bindings. Add your own in hypr/bindings.lua.
-- omarchy_default_bindings = false
--
-- Or disable only bindings for Omarchy's preinstalled apps/web apps while
-- keeping core window-manager bindings:
-- omarchy_preinstalled_bindings = false

-- Load Omarchy defaults.
require("default.hypr.omarchy")

-- Put your personal overrides in these files. They're loaded after Omarchy's
-- defaults so package updates can improve the defaults without rewriting your
-- ~/.config/hypr files.
require("hypr.monitors")
require("hypr.input")
require("hypr.bindings")
require("hypr.looknfeel")
require("hypr.autostart")

-- Toggle config flags dynamically.
require("default.hypr.toggles")

-- Keep 1Password in the scratchpad when it opens, without switching away
-- from the current workspace.
o.window("^1password$", { workspace = "special:scratchpad silent" })

-- Add any other personal Hyprland configuration below.
-- Keep both Slack web apps on workspace 3 without switching to it.
o.window("^chrome-app\\.slack\\.com__client_T0AKWKDTV0T_C0AKWKEART5-Default$", { workspace = "3 silent" })
o.window("^chrome-app\\.slack\\.com__client_T0AE6P7CEGY-Default$", { workspace = "3 silent" })
-- o.window("qemu", { workspace = "5" })

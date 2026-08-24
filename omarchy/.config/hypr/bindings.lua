-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- Toggle all columns on the active scrolling workspace between half and full width.
o.bind("SUPER + ALT + L", "Toggle scrolling columns wide", "~/.local/bin/hyprland-scrolling-width-toggle")

-- Omasnap screenshot overlay (same key toggles it open and closed).
hl.unbind("PRINT")
hl.unbind("F12")
hl.unbind("ALT + SHIFT + 4")
o.bind("PRINT", "Screenshot", "omasnap")
o.bind("F12", "Screenshot", "omasnap")
o.bind("ALT + SHIFT + 4", "Screenshot", "omasnap")
hl.layer_rule({
  match = { namespace = "^omasnap$" },
  no_anim = true,
  animation = "none",
})

-- Include personal and installed theme backgrounds in Quattro's picker.
hl.unbind("SUPER + CTRL + SPACE")
o.bind("SUPER + CTRL + SPACE", "Background switcher", "background=$(~/.local/bin/omarchy-theme-bg-switcher-all); [[ -n $background ]] && omarchy-theme-bg-set \"$background\"")

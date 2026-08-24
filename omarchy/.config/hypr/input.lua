-- Personal input overrides carried forward from the pre-Quattro setup.

hl.config({
  input = {
    kb_layout = "us",
    kb_options = "ctrl:nocaps,compose:lctrl,altwin:swap_lalt_lwin",
    repeat_rate = 40,
    repeat_delay = 250,
    numlock_by_default = true,
    touchpad = {
      clickfinger_behavior = true,
      scroll_factor = 0.4,
    },
  },
})

-- The Rainy 75 has its Alt/Windows legends wired opposite to the laptop,
-- so leave the global Alt/Super swap disabled for that keyboard.
for _, name in ipairs({
  "RDR Rainy 75",
  "RDR Rainy 75 Keyboard",
  "rdr-rainy-75-keyboard",
  "rdr-rainy-75",
}) do
  hl.device({
    name = name,
    kb_options = "ctrl:nocaps,compose:lctrl",
  })
end

o.window("(Alacritty|kitty|foot)", { scroll_touchpad = 1.5 })
o.window("com.mitchellh.ghostty", { scroll_touchpad = 0.2 })

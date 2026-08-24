# Omarchy package

This Stow package contains personal Omarchy and Hyprland configuration.

Install it from the repository root with:

```bash
stow -t "$HOME" omarchy
```

The package intentionally contains only personal overrides under `~/.config`
and personal scripts under `~/.local/bin`. Omarchy's defaults remain managed by
Omarchy under `/usr/share/omarchy`.

## External dependencies

- [`omasnap`](https://github.com/dgalarza/omasnap) — screenshot overlay, expected
  to be installed separately and available on `$PATH`.
- `jq`, `awk`, and `socat` — used by the personal Hyprland helper scripts.

`omasnap` is intentionally not vendored into this repository. The Hyprland
Print/F12 screenshot bindings will only work when it is installed.

## Machine-specific configuration

The Hyprland configuration includes hardware-specific settings for a Dell
AW3423DW monitor, an Elgato Prompter, and a Rainy 75 keyboard. Review
`~/.config/hypr/monitors.lua` and `~/.config/hypr/input.lua` before installing
on another machine.

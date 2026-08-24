# macOS package

This Stow package contains macOS-specific configuration. Install it from the
repository root with:

```bash
stow --no-folding --target="$HOME" macos
```

## Terminal and shell

**[Ghostty](https://ghostty.org)** is the terminal emulator. Font size is 18,
with a quick terminal toggle bound to `Alt+t`.

**[Zsh](https://www.zsh.org/)** is the shell, managed with [Zinit](https://github.com/zdharma-continuum/zinit). Four plugins are turbo-loaded:

- `zsh-autosuggestions`
- `zsh-syntax-highlighting`
- `zsh-completions`
- `zsh-history-substring-search`

The macOS package also contains the macOS-specific Neovim configuration and
[AeroSpace](https://github.com/nikitabobko/AeroSpace) window-manager config.

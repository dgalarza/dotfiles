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

## Editor

[Neovim](https://neovim.io) with [LazyVim](https://www.lazyvim.org) is the base
configuration. It uses Catppuccin, with the leader key set to `,`.

LazyVim extras enabled:

- Copilot
- mini-surround
- DAP (core)
- FZF
- Scala
- SQL
- Test (core)

Additional plugins:

- [nvim-metals](https://github.com/scalameta/nvim-metals) for Scala LSP via Metals
- [nvim-dap](https://github.com/mfussenegger/nvim-dap) configured for Scala debugging

## Window management

[AeroSpace](https://github.com/nikitabobko/AeroSpace) provides tiling window
management with i3-style keybindings. Workspaces are bound to `Ctrl+1-9`, window
focus uses `Alt+j/k/l/;`, and `Alt+Enter` opens a new Ghostty window.

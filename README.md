# Dotfiles

My personal dotfiles for macOS. This is a living config that changes as I try new tools and workflows. If you found this from one of my [YouTube videos](https://youtube.com/@damian.galarza), you're in the right place.

## Theme

[Catppuccin Mocha](https://github.com/catppuccin/catppuccin) is applied across the entire stack: Ghostty, Tmux, Neovim, Starship, and Eza. One palette, everywhere.

## Terminal

**[Ghostty](https://ghostty.org)** is the terminal emulator. Font size 18, with a quick terminal toggle bound to `Alt+t`.

**[Zsh](https://www.zsh.org/)** is the shell, managed with [Zinit](https://github.com/zdharma-continuum/zinit). Four plugins, all turbo-loaded:

- `zsh-autosuggestions`
- `zsh-syntax-highlighting`
- `zsh-completions`
- `zsh-history-substring-search`

**[Starship](https://starship.rs)** handles the prompt. Minimal layout with the directory on the left and git info (branch, state, status) on the right.

## Tmux

Key settings:

- Prefix: `Ctrl-s`
- Status bar at the top
- Vi mode for copy
- Mouse enabled
- Sessions persist and auto-restore via resurrect + continuum

Plugins managed by [TPM](https://github.com/tmux-plugins/tpm):

| Plugin | Purpose |
|--------|---------|
| tmux-sensible | Sensible defaults |
| tmux-yank | System clipboard integration |
| tmux-resurrect | Save and restore sessions |
| tmux-continuum | Automatic session saving |
| tmux-battery | Battery status in status bar |
| tmux-fzf | Fuzzy finder integration |
| tmux-fzf-url | Open URLs from the terminal |
| tmux-sessionx | Session management with fzf and zoxide |
| tmux-floax | Floating pane toggle |
| tmux-huckleberry | Git branch switcher |

## Editor

[Neovim](https://neovim.io) with [LazyVim](https://www.lazyvim.org) as the base distribution. Catppuccin colorscheme, leader key set to `,`.

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

## CLI Tools

| Tool | Purpose |
|------|---------|
| [Eza](https://github.com/eza-community/eza) | Modern `ls` with git integration |
| [Zoxide](https://github.com/ajeetdsouza/zoxide) | Smart `cd` that learns directories |
| [Atuin](https://atuin.sh) | Interactive shell history with sync |
| [Mise](https://mise.jdx.dev) | Dev tool version manager |
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder (used in Tmux and Neovim) |

## Window Management

[AeroSpace](https://github.com/nikitabobko/AeroSpace) is a tiling window manager for macOS with i3-style keybindings. Workspaces are bound to `Ctrl+1-9`, window focus uses `Alt+j/k/l/;`, and `Alt+Enter` opens a new Ghostty window.

## Git

Core settings:

- Fast-forward only merges (`merge.ff = only`)
- Autosquash on rebase (`rebase.autosquash = true`)
- `pf` alias for `push --force-with-lease`

Custom scripts in `.local/bin/`:

- `git up` fetches origin and rebases onto the primary branch
- `git delete-branch` removes a branch from both remote and local

## Repo Structure

- `.zshrc` at the repo root
- Tool configs under `.config/` (Ghostty, Tmux, Neovim, Starship, AeroSpace)
- Custom scripts in `.local/bin/`

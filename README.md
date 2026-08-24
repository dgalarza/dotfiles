# Dotfiles

My personal cross-platform dotfiles for macOS and Omarchy. This is a living config that changes as I try new tools and workflows. If you found this from one of my [YouTube videos](https://youtube.com/@damian.galarza), you're in the right place.

## Install

From a checkout of this repository:

```bash
./install.sh
```

The installer uses GNU Stow to install `common`, then the platform package:
`macos` on macOS or `omarchy` on Omarchy. It leaves Omarchy's `shell.json`
unmanaged because it contains local calendar configuration.

## Theme

Theme configuration is now platform-specific. The macOS setup uses [Catppuccin Mocha](https://github.com/catppuccin/catppuccin) across Ghostty, Tmux, Neovim, and Starship. Omarchy uses its active system theme, including the personal `damian-galarza` theme in this repository.

**[Starship](https://starship.rs)** handles the shared prompt. It uses a minimal layout with the directory on the left and git info (branch, state, status) on the right.

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

On macOS, [AeroSpace](https://github.com/nikitabobko/AeroSpace) is a tiling window manager with i3-style keybindings. On Omarchy, Hyprland and the Omarchy shell provide window management, the bar, menus, and notifications.

## Git

Core settings:

- Fast-forward only merges (`merge.ff = only`)
- Autosquash on rebase (`rebase.autosquash = true`)
- `pf` alias for `push --force-with-lease`

Custom scripts in `.local/bin/`:

- `git up` fetches origin and rebases onto the primary branch
- `git delete-branch` removes a branch from both remote and local

## Claude Code

Global [Claude Code](https://docs.anthropic.com/en/docs/claude-code) configuration lives in `.claude/`. This includes a global `CLAUDE.md` with cross-project context, slash commands, and reusable skills (marketing, content strategy, CRO, SEO, and more).

Run the setup script to symlink everything into `~/.claude/`:

```bash
./setup-claude.sh
```

The script also sets up a `~/vault` symlink to your Obsidian vault for private skills and business context that shouldn't live in a public repo.

## Repo Structure

- `common/` — shared shell, Git, Tmux, Starship, and scripts
- `macos/` — AeroSpace, Ghostty, and the macOS Neovim configuration
- `omarchy/` — Hyprland, Omarchy Neovim, personal shell plugins, theme, and scripts
- `.claude/` — Claude Code global config
- `install.sh` — platform-aware Stow installer

Third-party Omarchy plugins such as `omasnap`, `tobiasz-p.next-event`, and
`io.github.dgalarza.omarchy-buds` are managed separately. The Buds plugin also
requires `GalaxyBudsClient` (the `galaxybudsclient` command).

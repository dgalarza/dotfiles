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

Theme configuration is platform-specific. The macOS theme is documented in
`macos/README.md`; Omarchy uses its active system theme, including the personal
`damian-galarza` theme in this repository.

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

## CLI Tools

| Tool | Purpose |
|------|---------|
| [Eza](https://github.com/eza-community/eza) | Modern `ls` with git integration |
| [Zoxide](https://github.com/ajeetdsouza/zoxide) | Smart `cd` that learns directories |
| [Atuin](https://atuin.sh) | Interactive shell history with sync |
| [Mise](https://mise.jdx.dev) | Dev tool version manager |
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder (used in Tmux and Neovim) |

## Window Management

macOS window-management details are documented in `macos/README.md`. Omarchy
window management is provided by Omarchy and customized under `omarchy/` in
this repository.

## Git

Core settings:

- Fast-forward only merges (`merge.ff = only`)
- Autosquash on rebase (`rebase.autosquash = true`)
- `pf` alias for `push --force-with-lease`

Custom scripts in `.local/bin/`:

- `git up` fetches origin and rebases onto the primary branch
- `git delete-branch` removes a branch from both remote and local

## Claude Code

## Agent configuration

Shared global context lives in `agents/AGENTS.md` and is linked to the locations
expected by Codex, Pi, and Claude Code:

- `~/.codex/AGENTS.md`
- `~/.pi/agent/AGENTS.md`
- `~/.claude/CLAUDE.md`

Run the setup script to create those links and install the Claude Code commands
and skills:

```bash
./setup-agents.sh
```

Private skills, credentials, and other machine-specific agent state are intentionally not managed by this public repository.

## Repo Structure

- `common/` — shared shell, Git, Tmux, Starship, and scripts
- `macos/` — AeroSpace, Ghostty, and the macOS Neovim configuration
- `omarchy/` — Hyprland, Omarchy Neovim, personal shell plugins, theme, and scripts
- `agents/` — shared global agent context
- `.claude/` — Claude Code commands and skills
- `setup-agents.sh` — links shared agent context and Claude Code resources
- `install.sh` — platform-aware Stow installer

Third-party Omarchy plugins such as `omasnap`, `tobiasz-p.next-event`, and
`io.github.dgalarza.omarchy-buds` are managed separately. The Buds plugin also
requires `GalaxyBudsClient` (the `galaxybudsclient` command).

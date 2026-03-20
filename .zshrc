# =============================================================================
# Zinit
# =============================================================================

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Auto-install zinit if missing
if [[ ! -d "$ZINIT_HOME" ]]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# =============================================================================
# Plugins (turbo-loaded)
# =============================================================================

zinit light-mode for \
  atload"_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
  zsh-users/zsh-syntax-highlighting \
  zsh-users/zsh-completions \
  zsh-users/zsh-history-substring-search

# =============================================================================
# History
# =============================================================================

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

# =============================================================================
# Completion
# =============================================================================

autoload -Uz compinit
# Cache compinit — only regenerate once per day
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# =============================================================================
# Key bindings
# =============================================================================

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down

# =============================================================================
# PATH
# =============================================================================

typeset -U path
path=($HOME/.local/bin $HOME/.lmstudio/bin $path)

# Homebrew
if [[ -f /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv)"
elif [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# =============================================================================
# Environment
# =============================================================================

export EDITOR=nvim
export ENABLE_LSP_TOOLS=1
export CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1
export CLAUDE_CODE_DISABLE_AUTO_MEMORY=1

# =============================================================================
# Aliases
# =============================================================================

alias vim=nvim
alias ls=eza

# =============================================================================
# Tool integrations
# =============================================================================

# Atuin (interactive shell history)
if command -v atuin &>/dev/null; then
  eval "$(atuin init zsh)"
fi

# Zoxide (smart cd)
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# Starship prompt
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi

# Mise (dev tool version manager)
if command -v mise &>/dev/null; then
  eval "$(mise activate zsh)"
fi

# =============================================================================
# Local overrides
# =============================================================================

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

. "$HOME/.atuin/bin/env"

# opencode
export PATH=$HOME/.opencode/bin:$PATH

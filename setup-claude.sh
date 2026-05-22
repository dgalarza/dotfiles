#!/bin/bash
#
# Sets up Claude Code global config and agent skills by symlinking from
# dotfiles and connecting private skills from the Obsidian vault.
#
# Usage: ./setup-claude.sh
#

set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "$0")" && pwd)"
DOTFILES_CLAUDE="$DOTFILES_ROOT/.claude"
DOTFILES_AGENT_SKILLS="$DOTFILES_ROOT/.agents/skills"
CLAUDE_HOME="$HOME/.claude"
AGENTS_HOME="$HOME/.agents"

# --- Obsidian Vault Symlink ---

if [ ! -L "$HOME/vault" ] && [ ! -d "$HOME/vault" ]; then
  echo ""
  echo "Where is your Obsidian vault?"
  echo "  Examples:"
  echo "    /home/you/Documents/My Vault"
  echo "    /Users/you/Documents/My Vault"
  echo ""
  read -rp "Vault path: " vault_path

  if [ ! -d "$vault_path" ]; then
    echo "Error: '$vault_path' does not exist."
    exit 1
  fi

  ln -sfn "$vault_path" "$HOME/vault"
  echo "Created ~/vault -> $vault_path"
else
  echo "~/vault already exists -> $(readlink "$HOME/vault" 2>/dev/null || echo "(directory)")"
fi

VAULT="$HOME/vault"

# --- Ensure config directories exist ---

mkdir -p "$CLAUDE_HOME"
mkdir -p "$AGENTS_HOME/skills"

# --- Symlink CLAUDE.md ---

ln -sf "$DOTFILES_CLAUDE/CLAUDE.md" "$CLAUDE_HOME/CLAUDE.md"
echo "Linked CLAUDE.md"

# --- Symlink public agent skills from dotfiles ---

for skill_dir in "$DOTFILES_AGENT_SKILLS"/*/; do
  [ -d "$skill_dir" ] || continue
  name=$(basename "$skill_dir")
  # Remove existing (file, dir, or broken symlink) before linking
  rm -rf "$AGENTS_HOME/skills/$name"
  ln -sfn "$skill_dir" "$AGENTS_HOME/skills/$name"
done
echo "Linked $(ls -d "$DOTFILES_AGENT_SKILLS"/*/ 2>/dev/null | wc -l | tr -d ' ') public skills from dotfiles"

# --- Symlink private skills from Obsidian vault ---

VAULT_SKILLS="$VAULT/2-Areas/Claude Code/skills"

if [ -d "$VAULT_SKILLS" ]; then
  for skill_dir in "$VAULT_SKILLS"/*/; do
    [ -d "$skill_dir" ] || continue
    name=$(basename "$skill_dir")
    rm -rf "$AGENTS_HOME/skills/$name"
    ln -sfn "$skill_dir" "$AGENTS_HOME/skills/$name"
  done
  echo "Linked $(ls -d "$VAULT_SKILLS"/*/ 2>/dev/null | wc -l | tr -d ' ') private skills from vault"
else
  echo "Warning: Vault skills directory not found at $VAULT_SKILLS"
  echo "  Private skills (project-pricing, evaluate-sponsor, process-booking) won't be available"
  echo "  until the vault syncs."
fi

echo ""
echo "Done. Claude Code global config and agent skills are ready."
echo ""
echo "Note: settings.local.json is machine-specific and not managed by this script."
echo "If you need to add ~/vault as an additionalDirectory for a project,"
echo "update that project's .claude/settings.local.json manually."

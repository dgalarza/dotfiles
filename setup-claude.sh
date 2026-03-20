#!/bin/bash
#
# Sets up Claude Code global config by symlinking from dotfiles
# and connecting private skills from the Obsidian vault.
#
# Usage: ./setup-claude.sh
#

set -euo pipefail

DOTFILES_CLAUDE="$(cd "$(dirname "$0")" && pwd)/.claude"
CLAUDE_HOME="$HOME/.claude"

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

# --- Ensure ~/.claude directories exist ---

mkdir -p "$CLAUDE_HOME/skills"
mkdir -p "$CLAUDE_HOME/commands"

# --- Symlink CLAUDE.md ---

ln -sf "$DOTFILES_CLAUDE/CLAUDE.md" "$CLAUDE_HOME/CLAUDE.md"
echo "Linked CLAUDE.md"

# --- Symlink commands ---

for cmd in "$DOTFILES_CLAUDE"/commands/*.md; do
  [ -f "$cmd" ] || continue
  name=$(basename "$cmd")
  ln -sf "$cmd" "$CLAUDE_HOME/commands/$name"
  echo "Linked command: $name"
done

# --- Symlink public skills from dotfiles ---

for skill_dir in "$DOTFILES_CLAUDE"/skills/*/; do
  [ -d "$skill_dir" ] || continue
  name=$(basename "$skill_dir")
  # Remove existing (file, dir, or broken symlink) before linking
  rm -rf "$CLAUDE_HOME/skills/$name"
  ln -sfn "$skill_dir" "$CLAUDE_HOME/skills/$name"
done
echo "Linked $(ls -d "$DOTFILES_CLAUDE"/skills/*/ 2>/dev/null | wc -l | tr -d ' ') public skills from dotfiles"

# --- Symlink private skills from Obsidian vault ---

VAULT_SKILLS="$VAULT/2-Areas/Claude Code/skills"

if [ -d "$VAULT_SKILLS" ]; then
  for skill_dir in "$VAULT_SKILLS"/*/; do
    [ -d "$skill_dir" ] || continue
    name=$(basename "$skill_dir")
    rm -rf "$CLAUDE_HOME/skills/$name"
    ln -sfn "$skill_dir" "$CLAUDE_HOME/skills/$name"
  done
  echo "Linked $(ls -d "$VAULT_SKILLS"/*/ 2>/dev/null | wc -l | tr -d ' ') private skills from vault"
else
  echo "Warning: Vault skills directory not found at $VAULT_SKILLS"
  echo "  Private skills (project-pricing, evaluate-sponsor, process-booking) won't be available"
  echo "  until the vault syncs."
fi

echo ""
echo "Done. Claude Code global config is ready."
echo ""
echo "Note: settings.local.json is machine-specific and not managed by this script."
echo "If you need to add ~/vault as an additionalDirectory for a project,"
echo "update that project's .claude/settings.local.json manually."

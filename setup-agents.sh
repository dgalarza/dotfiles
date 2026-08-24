#!/usr/bin/env bash
# Set up shared global agent context and Claude Code resources.
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "$0")" && pwd)"
AGENTS_SOURCE="$DOTFILES_ROOT/agents/AGENTS.md"
CLAUDE_SOURCE="$DOTFILES_ROOT/.claude"
CLAUDE_HOME="$HOME/.claude"

if [[ ! -f "$AGENTS_SOURCE" ]]; then
  echo "Missing canonical agent context: $AGENTS_SOURCE" >&2
  exit 1
fi

# All agents share one canonical context file, with the filename each tool expects.
mkdir -p "$HOME/.codex" "$HOME/.pi/agent" "$CLAUDE_HOME"
ln -sfn "$AGENTS_SOURCE" "$HOME/.codex/AGENTS.md"
ln -sfn "$AGENTS_SOURCE" "$HOME/.pi/agent/AGENTS.md"
ln -sfn "$AGENTS_SOURCE" "$CLAUDE_HOME/CLAUDE.md"
echo "Linked global context for Codex, Pi, and Claude Code"

# --- Claude Code resources ---
mkdir -p "$CLAUDE_HOME/skills" "$CLAUDE_HOME/commands"
for cmd in "$CLAUDE_SOURCE"/commands/*.md; do
  [[ -f "$cmd" ]] || continue
  ln -sf "$cmd" "$CLAUDE_HOME/commands/$(basename "$cmd")"
done

for skill_dir in "$CLAUDE_SOURCE"/skills/*/; do
  [[ -d "$skill_dir" ]] || continue
  name=$(basename "$skill_dir")
  rm -rf "$CLAUDE_HOME/skills/$name"
  ln -sfn "$skill_dir" "$CLAUDE_HOME/skills/$name"
done

echo "Done. Machine-specific settings and private skills remain unmanaged."

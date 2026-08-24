#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$repo_root"

if ! command -v stow >/dev/null 2>&1; then
  echo "Error: GNU Stow is required. Install it with your system package manager." >&2
  exit 1
fi

packages=(common)
if [[ "$(uname -s)" == "Darwin" ]]; then
  packages+=(macos)
elif [[ -d /usr/share/omarchy ]] && command -v omarchy >/dev/null 2>&1; then
  packages+=(omarchy)
else
  echo "Error: could not identify macOS or an Omarchy installation." >&2
  exit 1
fi

for package in "${packages[@]}"; do
  echo "Stowing $package..."
  stow --no-folding --restow --target="$HOME" "$package"
done

if [[ "${packages[*]}" == *omarchy* ]]; then
  for command_name in jq socat; do
    if ! command -v "$command_name" >/dev/null 2>&1; then
      echo "Warning: Omarchy helper scripts require '$command_name'." >&2
    fi
  done

  if ! command -v omasnap >/dev/null 2>&1; then
    echo "Note: omasnap is not installed; screenshot bindings will not work." >&2
    echo "      Install it separately from ~/Code/omasnap or its upstream repository." >&2
  fi

  if ! command -v galaxybudsclient >/dev/null 2>&1; then
    echo "Note: GalaxyBudsClient is not installed; the Omarchy Buds plugin will not work." >&2
  fi
fi

echo "Installed: ${packages[*]}"

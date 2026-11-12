#!/usr/bin/env bash
# Installiert OpenJarvis und richtet die Konfiguration aus diesem Repo ein.
# Nutzung (macOS / Linux / WSL2):  ./install.sh
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${OPENJARVIS_HOME:-$HOME/.openjarvis}"

echo "==> OpenJarvis installieren (offizieller Installer)"
curl -fsSL https://open-jarvis.github.io/OpenJarvis/install.sh | bash

echo "==> Konfiguration nach $CONFIG_DIR kopieren"
mkdir -p "$CONFIG_DIR"
if [ -f "$CONFIG_DIR/config.toml" ]; then
  backup="$CONFIG_DIR/config.toml.bak.$(date +%Y%m%d%H%M%S)"
  cp "$CONFIG_DIR/config.toml" "$backup"
  echo "    Bestehende Konfiguration gesichert: $backup"
fi
cp "$REPO_DIR/config/config.toml" "$CONFIG_DIR/config.toml"
chmod 600 "$CONFIG_DIR/config.toml"

echo
echo "Fertig. Neues Terminal öffnen und starten mit:  jarvis"
echo "Status prüfen mit:                              jarvis doctor"

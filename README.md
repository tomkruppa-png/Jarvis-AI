# Jarvis-AI

Meine persönliche Einrichtung von [OpenJarvis](https://github.com/open-jarvis/OpenJarvis),
einem KI-Assistenten, der lokal auf dem eigenen Rechner läuft.

## Installation

Repo klonen und das Skript für dein System ausführen:

```bash
git clone https://github.com/tomkruppa-png/Jarvis-AI.git
cd Jarvis-AI
./install.sh          # macOS / Linux / WSL2
```

```powershell
.\install.ps1         # Windows (PowerShell)
```

Das Skript
1. führt den offiziellen OpenJarvis-Installer aus (installiert `uv`, Python-Umgebung,
   Ollama und ein Startmodell, dauert etwa 3 Minuten),
2. kopiert `config/config.toml` nach `~/.openjarvis/config.toml`
   (eine vorhandene Konfiguration wird vorher gesichert).

## Benutzen

```bash
jarvis                       # Chat starten
jarvis ask "Wie wird das Wetter?"
jarvis gui                   # Oberfläche im Browser (braucht Node.js 22+)
jarvis doctor                # Status und Probleme prüfen
```

## Konfiguration anpassen

Einstellungen stehen in [`config/config.toml`](config/config.toml). Nach einer
Änderung `./install.sh` erneut ausführen oder die Datei direkt nach
`~/.openjarvis/config.toml` kopieren.

- **Anderes Modell:** `default_model` ändern, z. B. `qwen3.5:9b` für bessere
  Antworten (braucht mehr Arbeitsspeicher).
- **Mehr Funktionen:** OpenJarvis bringt fertige Presets mit, etwa
  `code-assistant`, `deep-research` oder `morning-digest-linux`:
  `jarvis init --preset <name> --force`

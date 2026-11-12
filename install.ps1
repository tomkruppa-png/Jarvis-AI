# Installiert OpenJarvis und richtet die Konfiguration aus diesem Repo ein.
# Nutzung (Windows PowerShell):  .\install.ps1
$ErrorActionPreference = "Stop"

$ConfigDir = if ($env:OPENJARVIS_HOME) { $env:OPENJARVIS_HOME } else { Join-Path $HOME ".openjarvis" }

Write-Host "==> OpenJarvis installieren (offizieller Installer)"
Invoke-RestMethod https://open-jarvis.github.io/OpenJarvis/install.ps1 | Invoke-Expression

Write-Host "==> Konfiguration nach $ConfigDir kopieren"
New-Item -ItemType Directory -Force -Path $ConfigDir | Out-Null
$Target = Join-Path $ConfigDir "config.toml"
if (Test-Path $Target) {
    $Backup = "$Target.bak.$(Get-Date -Format yyyyMMddHHmmss)"
    Copy-Item $Target $Backup
    Write-Host "    Bestehende Konfiguration gesichert: $Backup"
}
Copy-Item (Join-Path $PSScriptRoot "config\config.toml") $Target -Force

Write-Host ""
Write-Host "Fertig. Neues Terminal oeffnen und starten mit:  jarvis"
Write-Host "Status pruefen mit:                              jarvis doctor"

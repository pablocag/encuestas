# Crea el repositorio remoto "encuestas" en GitHub (rama main) y hace el push inicial.
# Requisitos: GitHub CLI (winget install GitHub.cli) y sesión: gh auth login
# Uso: pwsh ./tool/github_encuestas_setup.ps1
#
# Si `gh` no se reconoce en PowerShell, este script añade GitHub CLI al PATH de la sesión.

$ErrorActionPreference = 'Stop'
$GhDir = Join-Path ${env:ProgramFiles} 'GitHub CLI'
$Gh = Join-Path $GhDir 'gh.exe'
if (-not (Test-Path $Gh)) {
  Write-Error "No se encuentra gh.exe. Instala: winget install GitHub.cli"
}
if (Test-Path $GhDir) {
  $env:Path = "$GhDir;$($env:Path)"
}

$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
Set-Location $RepoRoot

& $Gh auth status 2>$null
if ($LASTEXITCODE -ne 0) {
  Write-Host "No hay sesión en GitHub CLI. Completa el login (navegador)..."
  & $Gh auth login -h github.com -p https -w
}

$branch = (git branch --show-current)
if ($branch -ne 'main') {
  git branch -M main
}

# Si ya hay origin apuntando a encuestas, solo empuja
$originUrl = (git remote get-url origin 2>$null)
if ($originUrl -match 'encuestas') {
  Write-Host "Remote origin ya configurado ($originUrl). Subiendo main..."
  git push -u origin main
  if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
  Write-Host "Listo."
  exit 0
}

# gh repo create falla si origin existe con otra URL
if ($originUrl) {
  Write-Warning "Eliminando remote 'origin' anterior ($originUrl) para crear 'encuestas'."
  git remote remove origin
}

Write-Host "Creando repo encuestas (public) y subiendo main..."
& $Gh repo create encuestas `
  --public `
  --source=. `
  --remote=origin `
  --push `
  --description "Encuestas Prometheus — Flutter (Firebase, encuestas, membresías)"

if ($LASTEXITCODE -ne 0) {
  Write-Host @"

Si el nombre 'encuestas' ya está ocupado:
  gh repo create encuestas2 --public --source=. --remote=origin --push

Si creaste el repo vacío en la web:
  git remote add origin https://github.com/TU_USUARIO/encuestas.git
  git push -u origin main

Rama por defecto de nuevos repos (main): https://github.com/settings/repositories
"@

  exit $LASTEXITCODE
}

Write-Host "Listo."
$user = (& $Gh api user -q .login 2>$null)
if ($user) {
  Write-Host "Repo: https://github.com/$user/encuestas"
  Write-Host "Ajustes (rama por defecto): https://github.com/$user/encuestas/settings"
}

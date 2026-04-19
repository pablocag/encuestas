# Despliegue de la app Flutter Web a Firebase Hosting.
# Requisitos: Flutter SDK, Node/npm, `npm i -g firebase-tools`, sesión `firebase login`.
# Uso (desde la raíz del repo): pwsh ./tool/deploy_web_firebase.ps1

$ErrorActionPreference = 'Stop'
$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
Set-Location $RepoRoot

$envFile = Join-Path $RepoRoot '.env'
if (Test-Path $envFile) {
  Write-Host 'Compilando web con --dart-define-from-file=.env ...'
  flutter build web --release --dart-define-from-file=.env
}
else {
  Write-Warning 'No hay .env en la raíz; compilando sin --dart-define-from-file (claves vacías si dependen de ello).'
  flutter build web --release
}

Set-Location (Join-Path $RepoRoot 'firebase')
Write-Host 'Desplegando solo Hosting...'
firebase deploy --only hosting

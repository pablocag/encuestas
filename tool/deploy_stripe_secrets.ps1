# Sube STRIPE_SECRET_KEY_LIVE y STRIPE_SECRET_KEY_TEST a Google Secret Manager.
# Requisitos: API Secret Manager activa, Blaze, firebase login.
#
# Opciones (elige una):
#   A) Archivo .env en la raíz del repo (por defecto):
#        pwsh ./tool/deploy_stripe_secrets.ps1
#   B) Otro archivo con las mismas variables:
#        pwsh ./tool/deploy_stripe_secrets.ps1 -EnvPath C:\ruta\mis_claves.env
#   C) Variables de entorno de la sesión actual (sin guardar en disco):
#        $env:STRIPE_SECRET_KEY_LIVE='sk_live_...'; $env:STRIPE_SECRET_KEY_TEST='sk_test_...'
#        pwsh ./tool/deploy_stripe_secrets.ps1 -FromEnvironment
#
# Tras éxito: cd firebase && firebase deploy --only functions --project encuestas-prometheus-9tzwei

param(
  [string]$EnvPath = "",
  [switch]$FromEnvironment
)

$ErrorActionPreference = 'Stop'
$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$DefaultEnvFile = Join-Path $RepoRoot '.env'
$FirebaseDir = Join-Path $RepoRoot 'firebase'
$ProjectId = 'encuestas-prometheus-9tzwei'

function Get-DotEnvValue([string]$path, [string]$key) {
  if (-not (Test-Path $path)) { return $null }
  $pattern = '^\s*' + [regex]::Escape($key) + '\s*=\s*(.+)$'
  foreach ($line in Get-Content -Path $path -Encoding UTF8) {
    if ($line -match '^\s*#') { continue }
    if ($line -match $pattern) {
      return $Matches[1].Trim().Trim('"').Trim("'")
    }
  }
  return $null
}

[string]$live = $null
[string]$test = $null

if ($FromEnvironment) {
  $live = $env:STRIPE_SECRET_KEY_LIVE
  $test = $env:STRIPE_SECRET_KEY_TEST
  if ([string]::IsNullOrWhiteSpace($live) -or [string]::IsNullOrWhiteSpace($test)) {
    Write-Error "Con -FromEnvironment deben existir STRIPE_SECRET_KEY_LIVE y STRIPE_SECRET_KEY_TEST en el entorno de esta sesión."
  }
}
else {
  $file = if ($EnvPath) { $EnvPath } else { $DefaultEnvFile }
  if (-not (Test-Path $file)) {
    Write-Error "No existe el archivo: $file`nUsa .env en la raíz, -EnvPath, o -FromEnvironment (ver comentarios al inicio del script)."
  }
  $live = Get-DotEnvValue $file 'STRIPE_SECRET_KEY_LIVE'
  $test = Get-DotEnvValue $file 'STRIPE_SECRET_KEY_TEST'
  if ([string]::IsNullOrWhiteSpace($live) -or [string]::IsNullOrWhiteSpace($test)) {
    Write-Error "En $file deben existir STRIPE_SECRET_KEY_LIVE y STRIPE_SECRET_KEY_TEST."
  }
}

$tmpLive = Join-Path $env:TEMP "stripe_sm_live_$([guid]::NewGuid().ToString('N')).txt"
$tmpTest = Join-Path $env:TEMP "stripe_sm_test_$([guid]::NewGuid().ToString('N')).txt"
$utf8 = New-Object System.Text.UTF8Encoding $false
try {
  [System.IO.File]::WriteAllText($tmpLive, $live.Trim(), $utf8)
  [System.IO.File]::WriteAllText($tmpTest, $test.Trim(), $utf8)

  Set-Location $FirebaseDir
  Write-Host "Subiendo STRIPE_SECRET_KEY_LIVE..."
  firebase functions:secrets:set STRIPE_SECRET_KEY_LIVE --data-file $tmpLive --project $ProjectId --force
  Write-Host "Subiendo STRIPE_SECRET_KEY_TEST..."
  firebase functions:secrets:set STRIPE_SECRET_KEY_TEST --data-file $tmpTest --project $ProjectId --force
}
finally {
  Remove-Item -Path $tmpLive, $tmpTest -Force -ErrorAction SilentlyContinue
}

Write-Host ""
Write-Host "Secretos listos. Despliega las funciones:"
Write-Host "  cd firebase"
Write-Host "  firebase deploy --only functions --project $ProjectId"

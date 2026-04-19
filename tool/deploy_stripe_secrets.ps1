# Sube STRIPE_SECRET_KEY_LIVE y STRIPE_SECRET_KEY_TEST a Google Secret Manager
# leyendo valores desde .env en la raíz del repo (no imprime las claves).
# Requisitos: firebase-tools, `firebase login`, proyecto Blaze.
# Uso: pwsh ./tool/deploy_stripe_secrets.ps1
# Tras esto: cd firebase && firebase deploy --only functions

$ErrorActionPreference = 'Stop'
$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$EnvFile = Join-Path $RepoRoot '.env'
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

if (-not (Test-Path $EnvFile)) {
  Write-Error "No existe .env en la raíz. Copia .env.example y define STRIPE_SECRET_KEY_LIVE y STRIPE_SECRET_KEY_TEST."
}

$live = Get-DotEnvValue $EnvFile 'STRIPE_SECRET_KEY_LIVE'
$test = Get-DotEnvValue $EnvFile 'STRIPE_SECRET_KEY_TEST'
if ([string]::IsNullOrWhiteSpace($live) -or [string]::IsNullOrWhiteSpace($test)) {
  Write-Error "En .env deben existir STRIPE_SECRET_KEY_LIVE y STRIPE_SECRET_KEY_TEST (sin comillas o con comillas)."
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

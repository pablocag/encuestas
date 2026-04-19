# Aplica CORS al bucket por defecto de Firebase Storage (Flutter Web / XHR).
#
# Google Cloud Storage exige orígenes exactos (no admite "*.firebaseapp.com" en JSON).
# Este archivo incluye https://encuestas-prometheus-9tzwei.firebaseapp.com (equivalente
# práctico al subdominio de tu proyecto). Si usas otro dominio custom, añádelo en
# firebase/storage.cors.json y vuelve a ejecutar este script.
#
# Uso: pwsh ./tool/storage_cors_apply.ps1
# Opcional: pwsh ./tool/storage_cors_apply.ps1 -Bucket "gs://otro-bucket.appspot.com"

param(
  [string]$Bucket = 'gs://encuestas-prometheus-9tzwei.appspot.com'
)

$ErrorActionPreference = 'Stop'
$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$CorsFile = Join-Path $RepoRoot 'firebase\storage.cors.json'

if (-not (Test-Path $CorsFile)) {
  Write-Error "No existe $CorsFile"
}

function Find-Gsutil {
  $fromPath = Get-Command gsutil -ErrorAction SilentlyContinue
  $candidates = @(
    $(if ($fromPath) { $fromPath.Source } else { $null }),
    "$env:ProgramFiles\Google\Cloud SDK\google-cloud-sdk\bin\gsutil.cmd",
    "${env:ProgramFiles(x86)}\Google\Cloud SDK\google-cloud-sdk\bin\gsutil.cmd",
    "$env:LOCALAPPDATA\Google\Cloud SDK\google-cloud-sdk\bin\gsutil.cmd",
    "$env:USERPROFILE\AppData\Local\Google\Cloud SDK\google-cloud-sdk\bin\gsutil.cmd"
  ) | Where-Object { $_ -and (Test-Path $_) }
  if ($candidates.Count -ge 1) {
    return $candidates[0]
  }
  return $null
}

$gsutilExe = Find-Gsutil
if (-not $gsutilExe) {
  Write-Error @"
No se encuentra gsutil. Instala Google Cloud SDK y reinicia la terminal:
  https://cloud.google.com/sdk/docs/install

Luego (desde la raíz del repo):
  gsutil cors set firebase/storage.cors.json $Bucket
"@
}

Write-Host "Usando: $gsutilExe"
Write-Host "Aplicando CORS en $Bucket ..."
& $gsutilExe cors set $CorsFile $Bucket
if ($LASTEXITCODE -ne 0) {
  Write-Error @"
gsutil falló (código $LASTEXITCODE). Suele ser falta de sesión en Google Cloud SDK.
Ejecuta una vez:
  gcloud auth login
  gcloud config set project encuestas-prometheus-9tzwei
Luego vuelve a ejecutar este script.
"@
}
Write-Host "Listo. Espera unos segundos y recarga la web."

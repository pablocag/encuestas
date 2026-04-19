# Aplica CORS al bucket por defecto de Firebase Storage (necesario para Flutter Web +
# CachedNetworkImage / XHR frente a firebasestorage.googleapis.com).
#
# Requisitos: Google Cloud SDK (gsutil) y permisos sobre el proyecto.
# Uso: pwsh ./tool/storage_cors_apply.ps1
#
# Bucket por defecto del proyecto Firebase:

$ErrorActionPreference = 'Stop'
$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$CorsFile = Join-Path $RepoRoot 'firebase\storage.cors.json'
$Bucket = 'gs://encuestas-prometheus-9tzwei.appspot.com'

if (-not (Test-Path $CorsFile)) {
  Write-Error "No existe $CorsFile"
}

$gsutil = Get-Command gsutil -ErrorAction SilentlyContinue
if (-not $gsutil) {
  Write-Error @"
No se encuentra 'gsutil'. Instala Google Cloud SDK y vuelve a abrir la terminal:
  https://cloud.google.com/sdk/docs/install

Luego ejecuta manualmente:
  gsutil cors set firebase/storage.cors.json $Bucket
"@
}

Write-Host "Aplicando CORS en $Bucket ..."
& gsutil cors set $CorsFile $Bucket
Write-Host "Listo. Espera unos segundos y recarga la web."

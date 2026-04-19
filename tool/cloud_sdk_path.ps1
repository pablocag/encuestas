# Añade Google Cloud SDK al PATH de esta ventana de PowerShell (instalación típica en usuario).
# Uso (desde la raíz del repo, con punto y espacio para que afecte a la sesión actual):
#   . .\tool\cloud_sdk_path.ps1
# Luego ya deberían funcionar: gcloud auth login, gsutil, etc.

$sdkBin = Join-Path $env:LOCALAPPDATA 'Google\Cloud SDK\google-cloud-sdk\bin'
if (-not (Test-Path (Join-Path $sdkBin 'gcloud.cmd'))) {
  $alt = Join-Path ${env:ProgramFiles} 'Google\Cloud SDK\google-cloud-sdk\bin'
  if (Test-Path (Join-Path $alt 'gcloud.cmd')) {
    $sdkBin = $alt
  }
  else {
    Write-Error "No se encuentra gcloud. Instala Google Cloud SDK: https://cloud.google.com/sdk/docs/install"
  }
}

$env:Path = "$sdkBin;$env:Path"
Write-Host "Cloud SDK en PATH: $sdkBin"
Write-Host "Comprueba con: gcloud version"

# Ejecutar desde la raíz del repo: .\tool\ci.ps1
$ErrorActionPreference = "Stop"
Set-Location (Join-Path $PSScriptRoot '..')

flutter pub get
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

flutter analyze --no-fatal-infos --no-fatal-warnings
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

flutter test
exit $LASTEXITCODE

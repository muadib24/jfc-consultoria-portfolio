# Copia foto y PDF desde la carpeta padre (Consultoria) a web/assets/
$root = Split-Path -Parent $PSScriptRoot
$assets = Join-Path $PSScriptRoot "assets"

$foto = Join-Path $root "foto1.jpg"
$pdf  = Join-Path $root "JFC Consultoria Estrategica.pdf"

if (-not (Test-Path $assets)) { New-Item -ItemType Directory -Path $assets -Force | Out-Null }

if (Test-Path $foto) {
  Copy-Item -LiteralPath $foto -Destination (Join-Path $assets "photo.jpg") -Force
  Write-Host "OK: assets/photo.jpg"
} else { Write-Warning "No se encontro foto1.jpg en $root" }

if (Test-Path $pdf) {
  Copy-Item -LiteralPath $pdf -Destination (Join-Path $assets "JFC-Consultoria-Estrategica.pdf") -Force
  Write-Host "OK: assets/JFC-Consultoria-Estrategica.pdf"
} else { Write-Warning "No se encontro el PDF en $root" }

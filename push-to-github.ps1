# Uso:
#   1) Con GitHub CLI (recomendado): crea el repo y sube en un paso
#      .\push-to-github.ps1 -CreateWithGh -RepoName "jfc-consultoria-portfolio"
#
#   2) Repo ya creado en github.com (vacío, sin README):
#      .\push-to-github.ps1 -RemoteUrl "https://github.com/TU_USUARIO/TU_REPO.git"
#
param(
  [string] $RemoteUrl,
  [switch] $CreateWithGh,
  [string] $RepoName = "jfc-consultoria-portfolio",
  [string] $Description = "Portfolio - JFC Consultoria Estrategica / Javier Colladon"
)

$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

function Test-GitRemote {
  git remote get-url origin 2>$null
}

if (Test-GitRemote) {
  Write-Host "Ya existe 'origin'. Haciendo push..."
  git push -u origin main
  exit $LASTEXITCODE
}

if ($CreateWithGh) {
  $gh = Get-Command gh -ErrorAction SilentlyContinue
  if (-not $gh) {
    Write-Error "Instala GitHub CLI: https://cli.github.com/ y ejecuta: gh auth login"
    exit 1
  }
  gh repo create $RepoName --public --source=. --remote=origin --push --description $Description
  exit $LASTEXITCODE
}

if ($RemoteUrl) {
  git remote add origin $RemoteUrl
  git branch -M main
  git push -u origin main
  exit $LASTEXITCODE
}

Write-Host @"
No se indico accion. Ejemplos:

  gh auth login
  .\push-to-github.ps1 -CreateWithGh -RepoName "mi-portfolio"

o crea el repo vacio en GitHub y:

  .\push-to-github.ps1 -RemoteUrl "https://github.com/USUARIO/REPO.git"
"@

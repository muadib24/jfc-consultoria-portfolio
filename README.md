# Portfolio web — Javier Colladon / JFC Consultoría Estratégica

Sitio estático listo para **GitHub Pages** o **Vercel**. Contenido alineado al PDF corporativo y al perfil profesional.

## Antes del primer deploy

En PowerShell, desde esta carpeta `web`:

```powershell
.\setup-assets.ps1
```

Eso copia `foto1.jpg` → `assets/photo.jpg` y el PDF corporativo → `assets/JFC-Consultoria-Estrategica.pdf` desde la carpeta padre `Consultoria`.

## Subir a GitHub (push)

Desde esta carpeta `web`, en PowerShell:

**Opción A — GitHub CLI** (instalá [GitHub CLI](https://cli.github.com/) y ejecutá `gh auth login` una vez):

```powershell
.\push-to-github.ps1 -CreateWithGh -RepoName "jfc-consultoria-portfolio"
```

Eso crea el repo público, añade `origin` y hace `push` de la rama `main`.

**Opción B — Repo ya creado** (vacío, sin README en GitHub):

```powershell
.\push-to-github.ps1 -RemoteUrl "https://github.com/TU_USUARIO/TU_REPO.git"
```

(Si preferís SSH: `git@github.com:USUARIO/REPO.git`.)

## GitHub Pages

1. Tras el push, en el repo: **Settings → Pages → Build and deployment → Branch: `main`**, carpeta **`/ (root)`**.
2. El sitio quedará en `https://<usuario>.github.io/<repo>/`.

Archivo **`.nojekyll`** evita que Jekyll procese el sitio (HTML puro).

## Vercel

Importá el repo; **Root Directory** = `.` si el repo es solo `web`. Framework: **Other**.

## Estructura

```
web/
  index.html
  css/styles.css
  js/main.js
  assets/          (foto + PDF tras setup-assets.ps1)
  vercel.json
  .nojekyll
  README.md
```

Actualizá la URL de LinkedIn en `index.html` cuando quieras.

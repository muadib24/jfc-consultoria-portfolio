# Portfolio web — Javier Colladon / JFC Consultoría Estratégica

Sitio estático listo para **GitHub Pages** o **Vercel**. Contenido alineado al PDF corporativo y al perfil profesional.

## Antes del primer deploy

En PowerShell, desde esta carpeta `web`:

```powershell
.\setup-assets.ps1
```

Eso copia `foto1.jpg` → `assets/photo.jpg` y el PDF corporativo → `assets/JFC-Consultoria-Estrategica.pdf` desde la carpeta padre `Consultoria`.

## GitHub Pages

1. Creá un repositorio vacío en GitHub (por ejemplo `jfc-portfolio`).
2. Subí **solo el contenido de esta carpeta `web`** como raíz del repo (no la carpeta `Consultoria` completa, a menos que elijas `web` como subcarpeta; lo más simple es que el repo sea solo este sitio).
3. En el repo: **Settings → Pages → Build and deployment → Branch: `main`**, carpeta **`/ (root)`**.
4. El sitio quedará en `https://<usuario>.github.io/<repo>/`.

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

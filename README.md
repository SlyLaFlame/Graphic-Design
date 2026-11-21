# KIHBT Poster Gallery

A simple, fast gallery of posters I designed for the **Kenya Institute of Highways and Building Technology (KIHBT)**: event promotion, course announcements, awareness campaigns and internal communication.

**Live site:** 
**Portfolio:** https://shem-aberi.netlify.app

## Features

- Responsive grid that works on phones, tablets and desktops
- Click any poster to view it full size in a lightbox (close with the X, a click outside, or `Esc`)
- Lazy-loaded images for faster page loads
- No frameworks and no build step: plain HTML, CSS and JavaScript

## Project structure

```
Graphic-Design/
├── index.html             # The gallery page
├── posters.js             # Auto-generated list of posters (do not edit by hand)
├── generate-posters.ps1   # Script that rebuilds posters.js from the Posters folder
├── Posters/               # The poster image files
└── README.md
```

## Adding new posters

1. Add the image files (`.png`, `.jpg`, `.jpeg` or `.webp`) to the `Posters/` folder.
   - Name each file the way you want its caption to read. Underscores and hyphens become spaces, so `PBC_December.png` is shown as "PBC December".
   - Avoid very large files. Aim for a few hundred KB each; GitHub rejects files over 100 MB.
2. From the project folder, run:
   ```powershell
   powershell -ExecutionPolicy Bypass -File .\generate-posters.ps1
   ```
   This rewrites `posters.js` with every image in the folder, newest first. To sort A to Z instead, change `LastWriteTime -Descending` to `Name` in the script.
3. Open `index.html` in a browser to check the result.
4. Commit and push:
   ```bash
   git add .
   git commit -m "Add new posters"
   git push
   ```

## Deployment

The site is fully static, so it can be hosted anywhere that serves static files (Cloudflare Pages, GitHub Pages, Netlify, Vercel).

- **Cloudflare Pages:** connect this repo, leave the build command and output directory empty.
- **GitHub Pages:** in the repo's Settings, open Pages, choose "Deploy from a branch", then `main` and `/ (root)`.

## Tools

Posters are designed in Canva. The gallery itself is hand-coded HTML, CSS and vanilla JavaScript.

## Author

**Shem Aberi**: IT Graduate Trainee, ICT Department, KIHBT
GitHub: [@SlyLaFlame](https://github.com/SlyLaFlame)

&copy; 2026 Shem Aberi. All rights reserved. The posters are KIHBT materials and are shown here as a portfolio of my design work.

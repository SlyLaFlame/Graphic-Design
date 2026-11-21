# Scans the "Posters" folder and writes posters.js for the gallery page.
# Run it from the site folder every time you add or remove posters.

$exts = '.png', '.jpg', '.jpeg', '.webp'

$items = Get-ChildItem -Path "$PSScriptRoot\Posters" -File |
    Where-Object { $exts -contains $_.Extension.ToLower() } |
    Sort-Object LastWriteTime -Descending |   # newest first; change to "Name" for A-Z
    ForEach-Object {
        $caption = ($_.BaseName -replace '[_-]+', ' ').Trim()
        $file = [uri]::EscapeDataString($_.Name)
        "  { src: `"Posters/$file`", caption: `"$caption`" }"
    }

$content = "const posters = [`n" + ($items -join ",`n") + "`n];"
Set-Content -Path "$PSScriptRoot\posters.js" -Value $content -Encoding UTF8

Write-Host "Done: $($items.Count) posters written to posters.js"
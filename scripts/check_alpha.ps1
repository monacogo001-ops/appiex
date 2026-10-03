Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\dune_watch_hero.png")

Write-Output "Checking alpha channel of dune_watch_hero.png..."
$hasAlpha = $false
for ($y = 0; $y -lt $img.Height; $y += 20) {
    for ($x = 0; $x -lt $img.Width; $x += 20) {
        $c = $img.GetPixel($x, $y)
        if ($c.A -lt 250) {
            Write-Output ("Transparent pixel at x=" + $x + ", y=" + $y + " (A=" + $c.A + ")")
            $hasAlpha = $true
            break
        }
    }
    if ($hasAlpha) { break }
}
if (-not $hasAlpha) { Write-Output "Image is 100% opaque!" }
$img.Dispose()

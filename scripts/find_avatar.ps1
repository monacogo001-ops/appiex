Add-Type -AssemblyName System.Drawing
$src = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")

# Avatar search on tablet (near top-left of tablet)
# Avatar has skin tone (R > 180, G > 140, B > 100)
for ($y = 150; $y -le 220; $y += 2) {
    for ($x = 780; $x -le 860; $x += 2) {
        $c = $src.GetPixel($x, $y)
        if ($c.R -gt 150 -and $c.G -gt 120 -and $c.B -gt 90) {
            Write-Output ("Skin pixel at x=" + $x + ", y=" + $y + " (R=" + $c.R + ", G=" + $c.G + ", B=" + $c.B + ")")
        }
    }
}
$src.Dispose()

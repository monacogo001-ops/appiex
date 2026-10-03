Add-Type -AssemblyName System.Drawing
$src = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")

# Let's inspect tablet area around x = 550 to 750, y = 140 to 300
for ($y = 150; $y -le 250; $y += 20) {
    for ($x = 560; $x -le 650; $x += 10) {
        $c = $src.GetPixel($x, $y)
        if ($c.R -gt 50 -or $c.G -gt 50) {
            Write-Output ("Pixel at x=" + $x + ", y=" + $y + " (R=" + $c.R + ", G=" + $c.G + ", B=" + $c.B + ")")
        }
    }
}
$src.Dispose()

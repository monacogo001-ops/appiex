Add-Type -AssemblyName System.Drawing
$src = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")

# Let's inspect x from 750 to 850 for y from 160 to 220
Write-Output "--- Search Abe R on tablet ---"
for ($y = 170; $y -le 210; $y += 5) {
    for ($x = 760; $x -le 830; $x += 5) {
        $c = $src.GetPixel($x, $y)
        # In web_obsidian_black.png, text has R,G,B around 180-220
        if ($c.R -gt 150 -and $c.G -gt 150) {
            Write-Output ("Text at x=" + $x + ", y=" + $y + " (R=" + $c.R + ", G=" + $c.G + ", B=" + $c.B + ")")
        }
    }
}
$src.Dispose()

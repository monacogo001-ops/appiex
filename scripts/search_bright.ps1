Add-Type -AssemblyName System.Drawing
$src = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")

Write-Output "--- Search across right half for text ---"
for ($y = 120; $y -le 350; $y += 20) {
    for ($x = 550; $x -le 1100; $x += 20) {
        $c = $src.GetPixel($x, $y)
        # Bright text
        if ($c.R -gt 160 -and $c.G -gt 160 -and $c.B -gt 160) {
            Write-Output ("Bright text at x=" + $x + ", y=" + $y + " (R=" + $c.R + ", G=" + $c.G + ", B=" + $c.B + ")")
        }
    }
}
$src.Dispose()

Add-Type -AssemblyName System.Drawing
$src = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")

# Scan the top edge of the tablet (transition from background grey to black bezel)
for ($x = 830; $x -le 1200; $x += 40) {
    for ($y = 110; $y -le 210; $y++) {
        $c = $src.GetPixel($x, $y)
        # Background is > 60, bezel is < 30
        if ($c.R -lt 30) {
            Write-Output "x=$x, top edge y=$y (R=$($c.R))"
            break
        }
    }
}
$src.Dispose()

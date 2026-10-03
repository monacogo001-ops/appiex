Add-Type -AssemblyName System.Drawing
$src = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")

# Tablet bottom edge search
for ($x = 1000; $x -le 1080; $x += 20) {
    for ($y = 500; $y -le 560; $y += 2) {
        $c = $src.GetPixel($x, $y)
        # Check transition from dark bezel (R < 25) to grey background (R > 60)
        if ($c.R -gt 60) {
            Write-Output "x=$x, background reached at y=$y (R=$($c.R))"
            break
        }
    }
}

# Tablet bottom-left corner (near laptop screen overlap)
# The laptop screen overlaps the tablet around x = 795..810, y = 430..490
for ($y = 440; $y -le 490; $y += 5) {
    for ($x = 760; $x -le 810; $x += 5) {
        $c = $src.GetPixel($x, $y)
    }
}
$src.Dispose()

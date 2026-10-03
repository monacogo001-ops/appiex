Add-Type -AssemblyName System.Drawing
$src = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")

# Scan the bottom edge of the tablet from bottom up
for ($x = 750; $x -le 1080; $x += 40) {
    for ($y = 560; $y -ge 400; $y--) {
        $c = $src.GetPixel($x, $y)
        if ($c.R -lt 30) {
            Write-Output "x=$x, bottom edge y=$y (R=$($c.R))"
            break
        }
    }
}
$src.Dispose()

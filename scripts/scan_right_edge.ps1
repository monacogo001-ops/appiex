Add-Type -AssemblyName System.Drawing
$src = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")

# Right edge of tablet from y=200 to y=550
for ($y = 220; $y -le 540; $y += 40) {
    for ($x = 1220; $x -ge 1050; $x--) {
        $c = $src.GetPixel($x, $y)
        if ($c.R -lt 30) {
            Write-Output "y=$y, right edge x=$x (R=$($c.R))"
            break
        }
    }
}
$src.Dispose()

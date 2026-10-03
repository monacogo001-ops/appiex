Add-Type -AssemblyName System.Drawing
$src = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")

Write-Output "--- Searching for red text on tablet ---"
for ($y = 120; $y -le 380; $y += 10) {
    for ($x = 550; $x -le 850; $x += 5) {
        $c = $src.GetPixel($x, $y)
        # Red text or icons has R > 150, G < 60, B < 60
        if ($c.R -gt 150 -and $c.G -lt 60 -and $c.B -lt 60) {
            Write-Output "Red pixel at x=$x, y=$y (R=$($c.R), G=$($c.G), B=$($c.B))"
        }
    }
}
$src.Dispose()

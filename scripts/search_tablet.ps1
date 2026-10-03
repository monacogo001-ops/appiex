Add-Type -AssemblyName System.Drawing
$src = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")

Write-Output "--- TABLET TOP-LEFT SEARCH ---"
for ($y = 120; $y -le 160; $y += 5) {
    for ($x = 770; $x -le 850; $x += 5) {
        $c = $src.GetPixel($x, $y)
        if ($c.R -lt 40) {
            Write-Output "Dark pixel at x=$x, y=$y (R=$($c.R))"
            break
        }
    }
}
$src.Dispose()

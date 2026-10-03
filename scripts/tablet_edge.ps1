Add-Type -AssemblyName System.Drawing
$src = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")

for ($y = 125; $y -le 145; $y++) {
    for ($x = 810; $x -le 850; $x++) {
        $c = $src.GetPixel($x, $y)
        if ($c.R -lt 40) {
            Write-Output "y=$y, x=$x (R=$($c.R))"
            break
        }
    }
}
$src.Dispose()

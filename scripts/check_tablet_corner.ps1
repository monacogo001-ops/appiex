Add-Type -AssemblyName System.Drawing
$src = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")

Write-Output "--- Check device corner around x=580, y=140 ---"
for ($y = 130; $y -le 175; $y += 5) {
    for ($x = 560; $x -le 620; $x += 10) {
        $c = $src.GetPixel($x, $y)
        Write-Output ("x=" + $x + ", y=" + $y + " (R=" + $c.R + ", G=" + $c.G + ", B=" + $c.B + ")")
    }
}
$src.Dispose()

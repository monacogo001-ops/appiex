Add-Type -AssemblyName System.Drawing
$src = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")

Write-Output "--- Tablet top edge scan towards left ---"
for ($x = 550; $x -le 850; $x += 20) {
    for ($y = 130; $y -le 200; $y++) {
        $c = $src.GetPixel($x, $y)
        if ($c.R -lt 35) {
            Write-Output ("x=" + $x + ": top edge at y=" + $y + " (R=" + $c.R + ")")
            break
        }
    }
}
$src.Dispose()

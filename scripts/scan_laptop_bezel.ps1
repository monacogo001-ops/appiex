Add-Type -AssemblyName System.Drawing
$src = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")

Write-Output "--- LAPTOP RIGHT BEZEL BOUNDARY ---"
for ($y = 190; $y -le 480; $y += 30) {
    for ($x = 810; $x -ge 765; $x--) {
        $c = $src.GetPixel($x, $y)
        if ($c.R -gt 15) {
            Write-Output ("y=" + $y + " tablet visible at x >= " + ($x + 1) + " (content at x=" + $x + " R=" + $c.R + ")")
            break
        }
    }
}
$src.Dispose()

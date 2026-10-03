Add-Type -AssemblyName System.Drawing
$src = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")

Write-Output "--- Scan tablet top-left edge x=750..830 ---"
for ($x = 750; $x -le 830; $x += 10) {
    for ($y = 100; $y -le 140; $y++) {
        $c = $src.GetPixel($x, $y)
        if ($c.R -lt 40) {
            Write-Output ("x=" + $x + ": edge at y=" + $y + " (R=" + $c.R + ")")
            break
        }
    }
}
$src.Dispose()

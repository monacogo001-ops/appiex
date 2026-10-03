Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\brain\bfed1761-8626-4151-9207-1cb48e391c9e\.system_generated\steps\1837\media_0.png")

# Where is "Wireless" or red text on the laptop screen?
for ($y = 480; $y -le 560; $y += 10) {
    for ($x = 250; $x -le 750; $x += 40) {
        $c = $img.GetPixel($x, $y)
        if ($c.R -gt 150 -and $c.G -lt 50) {
            Write-Output ("Red pixel in preview at x=" + $x + ", y=" + $y + " (R=" + $c.R + ")")
        }
    }
}
$img.Dispose()

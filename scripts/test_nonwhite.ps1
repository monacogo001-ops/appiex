Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\brain\bfed1761-8626-4151-9207-1cb48e391c9e\.system_generated\steps\1837\media_0.png")

for ($x = 280; $x -le 780; $x += 40) {
    for ($y = 440; $y -le 490; $y += 10) {
        $c = $img.GetPixel($x, $y)
        if ($c.R -lt 100) {
            Write-Output ("Non-white at x=" + $x + ", y=" + $y + " (R=" + $c.R + ", G=" + $c.G + ", B=" + $c.B + ")")
        }
    }
}
$img.Dispose()

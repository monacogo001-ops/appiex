Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\brain\bfed1761-8626-4151-9207-1cb48e391c9e\.system_generated\steps\2043\media_0.png")

Write-Output "Scanning steps/2043/media_0.png at x=330 from y=440 to 550..."
for ($y = 440; $y -le 550; $y += 5) {
    $c = $img.GetPixel(330, $y)
    Write-Output ("y=" + $y + ": R=" + $c.R + ", G=" + $c.G + ", B=" + $c.B)
}
$img.Dispose()

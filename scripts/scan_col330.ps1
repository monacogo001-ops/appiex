Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\brain\bfed1761-8626-4151-9207-1cb48e391c9e\.system_generated\steps\1945\media_0.png")

Write-Output "Scanning column 330 from y=450 to 768..."
for ($y = 450; $y -le 760; $y += 5) {
    $c = $img.GetPixel(330, $y)
    Write-Output ("y=" + $y + ": R=" + $c.R + ", G=" + $c.G + ", B=" + $c.B)
}
$img.Dispose()

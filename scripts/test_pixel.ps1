Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\brain\bfed1761-8626-4151-9207-1cb48e391c9e\.system_generated\steps\1837\media_0.png")

$c = $img.GetPixel(330, 460)
Write-Output ("media_0.png at (330, 460): R=" + $c.R + ", G=" + $c.G + ", B=" + $c.B)
$img.Dispose()

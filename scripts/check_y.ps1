Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\brain\bfed1761-8626-4151-9207-1cb48e391c9e\.system_generated\steps\1837\media_0.png")

# Let's search for "Wireless Headphones" or product thumbnails in media_0.png
# Let's inspect x=330, y=490..680
for ($y = 480; $y -le 680; $y += 20) {
    $c = $img.GetPixel(330, $y)
    Write-Output ("y=" + $y + ": R=" + $c.R + ", G=" + $c.G + ", B=" + $c.B)
}
$img.Dispose()

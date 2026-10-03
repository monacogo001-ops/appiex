Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\brain\bfed1761-8626-4151-9207-1cb48e391c9e\.system_generated\steps\1945\media_0.png")

Write-Output "--- test_opacity50 pixels at x=330, y=400..500 ---"
for ($y = 400; $y -le 500; $y += 10) {
    $c = $img.GetPixel(330, $y)
    Write-Output ("y=" + $y + ": R=" + $c.R + ", G=" + $c.G + ", B=" + $c.B)
}
$img.Dispose()

Add-Type -AssemblyName System.Drawing
$img0 = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\brain\bfed1761-8626-4151-9207-1cb48e391c9e\.system_generated\steps\1837\media_0.png")
$base = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")

Write-Output "Checking differences in laptop screen area (x=300..750, y=420..490)..."
$diffCount = 0
$sameCount = 0
for ($y = 420; $y -le 490; $y += 5) {
    for ($x = 300; $x -le 750; $x += 10) {
        $c0 = $img0.GetPixel($x, $y)
        $cb = $base.GetPixel($x, $y)
        $diff = [Math]::Abs($c0.R - $cb.R) + [Math]::Abs($c0.G - $cb.G) + [Math]::Abs($c0.B - $cb.B)
        if ($diff -lt 10) {
            $sameCount++
        } else {
            $diffCount++
        }
    }
}
Write-Output ("Pixels matching base: " + $sameCount + ", Different: " + $diffCount)
$img0.Dispose()
$base.Dispose()

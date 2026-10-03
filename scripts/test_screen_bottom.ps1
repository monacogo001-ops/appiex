Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\brain\bfed1761-8626-4151-9207-1cb48e391c9e\.system_generated\steps\1837\media_0.png")

# Let's search across the entire laptop screen area (x: 250..800, y: 175..500)
# for any text "Featured Products" or dark background
$whiteCount = 0
$nonWhiteCount = 0
for ($x = 280; $x -le 780; $x += 20) {
    for ($y = 440; $y -le 490; $y += 5) {
        $c = $img.GetPixel($x, $y)
        if ($c.R -gt 220 -and $c.G -gt 220 -and $c.B -gt 220) {
            $whiteCount++
        } else {
            $nonWhiteCount++
        }
    }
}
Write-Output ("White count: " + $whiteCount + ", Non-white: " + $nonWhiteCount)
$img.Dispose()

Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black_original.png")

Write-Output "Finding 'Wireless Headphones' bounding box in original image..."
$minX = 9999; $maxX = 0; $minY = 9999; $maxY = 0

# The text "Wireless Headphones" is white text on dark background
# Let's search around x = 250..450, y = 450..550
for ($y = 450; $y -le 550; $y++) {
    for ($x = 260; $x -le 420; $x++) {
        $c = $img.GetPixel($x, $y)
        # White text in that bar
        if ($c.R -gt 180 -and $c.G -gt 180 -and $c.B -gt 180) {
            # Check if this pixel is inside the text "Wireless"
            if ($x -lt $minX) { $minX = $x }
            if ($x -gt $maxX) { $maxX = $x }
            if ($y -lt $minY) { $minY = $y }
            if ($y -gt $maxY) { $maxY = $y }
        }
    }
}
Write-Output ("Text Bounding Box: X=[" + $minX + ".." + $maxX + "], Y=[" + $minY + ".." + $maxY + "]")
$img.Dispose()

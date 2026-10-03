Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\brain\bfed1761-8626-4151-9207-1cb48e391c9e\.system_generated\steps\1945\media_0.png")

# Let's search across the entire image for the text "Wireless Headphones"
# "Wireless Headphones" is white text on dark background in web_obsidian_black.png
$found = $false
for ($y = 400; $y -le 520; $y++) {
    for ($x = 200; $x -le 600; $x++) {
        $c = $img.GetPixel($x, $y)
        # In web_obsidian_black, the text "Wireless Headphones" has R,G,B ~ 180-220
        # If it's pure white (255,255,255) from the Dune banner, that's banner!
        if ($c.R -gt 150 -and $c.R -lt 250 -and $c.G -gt 150 -and $c.G -lt 250) {
            # Check neighbors
            $c1 = $img.GetPixel($x + 1, $y)
            $c2 = $img.GetPixel($x + 2, $y)
            if ($c1.R -gt 150 -and $c1.R -lt 250 -and $c2.R -gt 150 -and $c2.R -lt 250) {
                Write-Output ("Text found at x=" + $x + ", y=" + $y + " (R=" + $c.R + ", G=" + $c.G + ", B=" + $c.B + ")")
                $found = $true
                break
            }
        }
    }
    if ($found) { break }
}
if (-not $found) { Write-Output "No old text found anywhere on the laptop screen!" }
$img.Dispose()

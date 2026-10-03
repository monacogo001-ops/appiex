Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black_original.png")

# Scan the bottom border of the laptop screen (where the black inner bezel meets the metal hinge/keyboard)
Write-Output "Scanning bottom screen edge across x=260..800..."
for ($x = 280; $x -le 800; $x += 40) {
    # Start from y = 500 down to 560
    for ($y = 510; $y -le 570; $y++) {
        $c = $img.GetPixel($x, $y)
        # Metal chassis / hinge is bright or grey
        # Screen is dark
    }
}

# Let's inspect column 350 from y=510 to 550
for ($y = 515; $y -le 545; $y++) {
    $c = $img.GetPixel(350, $y)
    Write-Output ("x=350, y=" + $y + ": R=" + $c.R + ", G=" + $c.G + ", B=" + $c.B)
}
$img.Dispose()

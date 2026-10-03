Add-Type -AssemblyName System.Drawing
$src = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")

Write-Output "--- Trace tablet left edge ---"
for ($y = 120; $y -le 520; $y += 30) {
    for ($x = 500; $x -le 850; $x++) {
        $c = $src.GetPixel($x, $y)
        # Tablet screen has dark pixels < 35, or content
        # Background is > 65
    }
}

# In web_obsidian_black.png, where is "Dashboard" and "Products" on the tablet?
# Let's find where the tablet's left outer metal edge is for y=120..500
for ($y = 130; $y -le 500; $y += 40) {
    for ($x = 550; $x -le 850; $x++) {
        $c = $src.GetPixel($x, $y)
        # Scan from left background (> 60) to dark bezel/screen (< 40)
        # But skip laptop! Laptop x is between 250 and 800.
        # Tablet is visible above laptop (y < 175) or to the right of laptop (x > 800)
    }
}
$src.Dispose()

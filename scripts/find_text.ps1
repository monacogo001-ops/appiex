Add-Type -AssemblyName System.Drawing
$src = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")

# Let's inspect where the word "Products" is located on the tablet
# "Products" is bright white text (R > 200, G > 200, B > 200) near y ~ 200-240
for ($y = 200; $y -le 240; $y += 5) {
    for ($x = 650; $x -le 900; $x += 10) {
        $c = $src.GetPixel($x, $y)
        if ($c.R -gt 200 -and $c.G -gt 200 -and $c.B -gt 200) {
            Write-Output ("White text pixel at x=" + $x + ", y=" + $y)
        }
    }
}
$src.Dispose()

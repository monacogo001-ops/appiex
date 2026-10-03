Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")

# Let's inspect x=330 from y=480 to 680
for ($y = 480; $y -le 680; $y += 20) {
    $c = $img.GetPixel(330, $y)
    Write-Output ("web_obsidian y=" + $y + ": R=" + $c.R + ", G=" + $c.G + ", B=" + $c.B)
}
$img.Dispose()

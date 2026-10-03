Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")

Write-Output "Scanning images/web_obsidian_black.png at x=330..."
for ($y = 440; $y -le 500; $y += 5) {
    $c = $img.GetPixel(330, $y)
    Write-Output ("y=" + $y + ": R=" + $c.R + ", G=" + $c.G + ", B=" + $c.B)
}
$img.Dispose()

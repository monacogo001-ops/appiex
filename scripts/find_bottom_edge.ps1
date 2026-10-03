Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black_original.png")

for ($y = 540; $y -le 570; $y++) {
    $c = $img.GetPixel(350, $y)
    Write-Output ("x=350, y=" + $y + ": R=" + $c.R + ", G=" + $c.G + ", B=" + $c.B)
}
$img.Dispose()

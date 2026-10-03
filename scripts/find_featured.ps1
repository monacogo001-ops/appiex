Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")

# Search for "Featured Products"
for ($y = 350; $y -le 480; $y += 10) {
    for ($x = 300; $x -le 450; $x += 10) {
        $c = $img.GetPixel($x, $y)
        if ($c.R -gt 200 -and $c.G -gt 200 -and $c.B -gt 200) {
            Write-Output ("White text at x=" + $x + ", y=" + $y)
        }
    }
}
$img.Dispose()

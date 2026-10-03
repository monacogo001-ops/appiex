Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black_original.png")

Write-Output "Finding bottom chin of laptop screen across x..."
# Scan across x from 270 to 810
for ($x = 270; $x -le 810; $x += 30) {
    # Scan y from 520 to 570 to find the hinge shadow gap (R <= 2)
    for ($y = 520; $y -le 570; $y++) {
        $c = $img.GetPixel($x, $y)
        if ($c.R -le 2 -and $c.G -le 2 -and $c.B -le 2) {
            Write-Output ("x=" + $x + ": hinge gap at y=" + $y)
            break
        }
    }
}
$img.Dispose()

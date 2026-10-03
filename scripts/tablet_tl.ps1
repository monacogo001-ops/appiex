Add-Type -AssemblyName System.Drawing
$src = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")

# Tablet Top-Left corner:
for ($y = 114; $y -le 126; $y++) {
    for ($x = 825; $x -le 840; $x++) {
        $c = $src.GetPixel($x, $y)
        if ($c.R -lt 40) {
            Write-Output "y=$y, first dark x=$x (R=$($c.R))"
            break
        }
    }
}
$src.Dispose()

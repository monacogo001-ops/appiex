Add-Type -AssemblyName System.Drawing
$src = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")

# Let's inspect tablet content above y=154 around x = 760..840
Write-Output "--- Tablet top-left area scan ---"
for ($y = 135; $y -le 165; $y += 3) {
    $row = ""
    for ($x = 760; $x -le 830; $x += 5) {
        $c = $src.GetPixel($x, $y)
        $row += "$($c.R.ToString('D2')) "
    }
    Write-Output ("y=" + $y + ": " + $row)
}
$src.Dispose()

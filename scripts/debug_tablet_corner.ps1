Add-Type -AssemblyName System.Drawing
$src = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")

for ($y = 105; $y -le 125; $y += 5) {
    $row = ""
    for ($x = 760; $x -le 840; $x += 10) {
        $c = $src.GetPixel($x, $y)
        $row += "$($c.R.ToString('D2')) "
    }
    Write-Output ("y=" + $y + ": " + $row)
}
$src.Dispose()

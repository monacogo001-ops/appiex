Add-Type -AssemblyName System.Drawing
$src = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")

Write-Output "--- LAPTOP TOP-LEFT SCAN ---"
for ($y = 168; $y -le 178; $y++) {
    $row = ""
    for ($x = 242; $x -le 255; $x++) {
        $c = $src.GetPixel($x, $y)
        $row += ($c.R.ToString("D2") + " ")
    }
    Write-Output ("y=" + $y + ": " + $row)
}

Write-Output "--- LAPTOP TOP-RIGHT SCAN ---"
for ($y = 175; $y -le 185; $y++) {
    $row = ""
    for ($x = 760; $x -le 772; $x++) {
        $c = $src.GetPixel($x, $y)
        $row += ($c.R.ToString("D2") + " ")
    }
    Write-Output ("y=" + $y + ": " + $row)
}

Write-Output "--- LAPTOP BOTTOM-LEFT SCAN ---"
for ($y = 492; $y -le 502; $y++) {
    $row = ""
    for ($x = 270; $x -le 282; $x++) {
        $c = $src.GetPixel($x, $y)
        $row += ($c.R.ToString("D2") + " ")
    }
    Write-Output ("y=" + $y + ": " + $row)
}

Write-Output "--- LAPTOP BOTTOM-RIGHT SCAN ---"
for ($y = 484; $y -le 494; $y++) {
    $row = ""
    for ($x = 795; $x -le 806; $x++) {
        $c = $src.GetPixel($x, $y)
        $row += ($c.R.ToString("D2") + " ")
    }
    Write-Output ("y=" + $y + ": " + $row)
}

$src.Dispose()

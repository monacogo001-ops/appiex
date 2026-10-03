Add-Type -AssemblyName System.Drawing
$src = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")

Write-Output "--- TABLET TOP-LEFT SCAN ---"
for ($y = 110; $y -le 122; $y++) {
    $row = ""
    for ($x = 778; $x -le 790; $x++) {
        $c = $src.GetPixel($x, $y)
        $row += ($c.R.ToString("D2") + " ")
    }
    Write-Output ("y=" + $y + ": " + $row)
}

Write-Output "--- TABLET TOP-RIGHT SCAN ---"
for ($y = 192; $y -le 205; $y++) {
    $row = ""
    for ($x = 1198; $x -le 1212; $x++) {
        $c = $src.GetPixel($x, $y)
        $row += ($c.R.ToString("D2") + " ")
    }
    Write-Output ("y=" + $y + ": " + $row)
}

Write-Output "--- TABLET BOTTOM-RIGHT SCAN ---"
for ($y = 505; $y -le 520; $y++) {
    $row = ""
    for ($x = 1068; $x -le 1085; $x++) {
        $c = $src.GetPixel($x, $y)
        $row += ($c.R.ToString("D2") + " ")
    }
    Write-Output ("y=" + $y + ": " + $row)
}

$src.Dispose()

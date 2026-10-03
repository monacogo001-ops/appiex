Add-Type -AssemblyName System.Drawing
$src = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")
$bmp = New-Object System.Drawing.Bitmap($src.Width, $src.Height)
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.DrawImage($src, 0, 0, $src.Width, $src.Height)

$penRed = New-Object System.Drawing.Pen([System.Drawing.Color]::Lime, 2)
$penCyan = New-Object System.Drawing.Pen([System.Drawing.Color]::Cyan, 2)

# Laptop display inner corners:
# Top-Left, Top-Right, Bottom-Right, Bottom-Left
$lapTL = New-Object System.Drawing.Point(252, 175)
$lapTR = New-Object System.Drawing.Point(761, 181)
$lapBR = New-Object System.Drawing.Point(800, 488)
$lapBL = New-Object System.Drawing.Point(277, 497)

$g.DrawPolygon($penRed, @($lapTL, $lapTR, $lapBR, $lapBL))

# Tablet display inner corners:
$tabTL = New-Object System.Drawing.Point(834, 154)
$tabTR = New-Object System.Drawing.Point(1198, 202)
$tabBR = New-Object System.Drawing.Point(1074, 513)
$tabBL = New-Object System.Drawing.Point(752, 450)

$g.DrawPolygon($penCyan, @($tabTL, $tabTR, $tabBR, $tabBL))

$g.Dispose()
$src.Dispose()
$bmp.Save("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\test_marked2.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
Write-Output "Saved test_marked2.png"

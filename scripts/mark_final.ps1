Add-Type -AssemblyName System.Drawing
$src = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black_original.png")
$bmp = New-Object System.Drawing.Bitmap($src.Width, $src.Height)
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.DrawImage($src, 0, 0, $src.Width, $src.Height)

$penRed = New-Object System.Drawing.Pen([System.Drawing.Color]::Lime, 2)
$penCyan = New-Object System.Drawing.Pen([System.Drawing.Color]::Cyan, 2)

# Correct Laptop display inner corners:
$lapTL = New-Object System.Drawing.Point(252, 175)
$lapTR = New-Object System.Drawing.Point(761, 181)
$lapBR = New-Object System.Drawing.Point(802, 516)
$lapBL = New-Object System.Drawing.Point(272, 542)

$g.DrawPolygon($penRed, @($lapTL, $lapTR, $lapBR, $lapBL))

# Tablet display inner corners:
$tabTL = New-Object System.Drawing.Point(824, 116)
$tabTR = New-Object System.Drawing.Point(1193, 207)
$tabBR = New-Object System.Drawing.Point(1073, 548)
$tabBL = New-Object System.Drawing.Point(653, 456)

$g.DrawPolygon($penCyan, @($tabTL, $tabTR, $tabBR, $tabBL))

$g.Dispose()
$src.Dispose()
$bmp.Save("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\test_marked_final.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
Write-Output "Saved test_marked_final.png"

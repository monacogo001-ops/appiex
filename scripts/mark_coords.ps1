Add-Type -AssemblyName System.Drawing
$src = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")
$bmp = New-Object System.Drawing.Bitmap($src.Width, $src.Height)
$g = [System.Drawing.Graphics]::FromImage($bmp)
$g.DrawImage($src, 0, 0, $src.Width, $src.Height)

$penRed = New-Object System.Drawing.Pen([System.Drawing.Color]::Lime, 3)
$penCyan = New-Object System.Drawing.Pen([System.Drawing.Color]::Cyan, 3)

# Initial estimate for laptop display:
# Top-left, Top-right, Bottom-right, Bottom-left
$lapTL = New-Object System.Drawing.Point(245, 172)
$lapTR = New-Object System.Drawing.Point(768, 180)
$lapBR = New-Object System.Drawing.Point(800, 488)
$lapBL = New-Object System.Drawing.Point(276, 497)

$g.DrawPolygon($penRed, @($lapTL, $lapTR, $lapBR, $lapBL))

# Initial estimate for tablet display:
$tabTL = New-Object System.Drawing.Point(782, 115)
$tabTR = New-Object System.Drawing.Point(1208, 198)
$tabBR = New-Object System.Drawing.Point(1079, 513)
$tabBL = New-Object System.Drawing.Point(742, 444)

$g.DrawPolygon($penCyan, @($tabTL, $tabTR, $tabBR, $tabBL))

$g.Dispose()
$src.Dispose()
$bmp.Save("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\test_marked.png", [System.Drawing.Imaging.ImageFormat]::Png)
$bmp.Dispose()
Write-Output "Saved test_marked.png"

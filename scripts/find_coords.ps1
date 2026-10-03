Add-Type -AssemblyName System.Drawing
$bmp = [System.Drawing.Bitmap]::FromFile("C:\Users\SOWDA\.gemini\antigravity\scratch\appiex\images\web_obsidian_black.png")

# Let's inspect coordinates across rows and columns to find bezel borders
Write-Output "Image width: $($bmp.Width), height: $($bmp.Height)"

# Laptop top bezel: around y = 170
for ($x = 240; $x -le 780; $x += 40) {
    for ($y = 150; $y -le 200; $y += 2) {
        $c = $bmp.GetPixel($x, $y)
        # Check transition from dark bezel/background to screen inner content
        # Bezel is very dark, background is grey ~60-80
    }
}
$bmp.Dispose()

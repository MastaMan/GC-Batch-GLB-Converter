:: Blender Sceenshot
:: 1.0.0
:: Vasyl Lukianenko 
:: 3DGROUND
:: https://3dground.net

echo off

cls

set input=%1
set blender=
set file=
set script=
set scr=

for /f "tokens=1,2,3,4 delims=;" %%i in (%input%) do (
	set blender=%%i
	set file=%%j
	set script=%%k
	set scr=%%l
)

:::!!!
set blender_alt=c:\Program Files\WindowsApps\BlenderFoundation.Blender3.6LTS_3.6.16.0_x64__ppwjx1n5r4v9t\Blender\blender-launcher.exe

if exist "%blender_alt%" (
	set blender=%blender_alt%
)

taskkill /f /im blender.exe

"%blender%" "%file%" -P "%script%"

timeout /t 10 /nobreak > nul

powershell -command "Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $screen = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds; $bitmap = New-Object System.Drawing.Bitmap $screen.Width, $screen.Height; $graphics = [System.Drawing.Graphics]::FromImage($bitmap); $graphics.CopyFromScreen($screen.Location, [System.Drawing.Point]::Empty, $screen.Size); $bitmap.Save('%scr%'); $graphics.Dispose(); $bitmap.Dispose();"

taskkill /f /im blender.exe

rem exit 0
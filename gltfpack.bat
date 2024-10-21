:: GLTF Packer
:: 1.0.0
:: Vasyl Lukianenko 
:: 3DGROUND
:: https://3dground.net

echo off
cls

set input=%1
set gltf=
set glb=

for /f "tokens=1,2,3 delims=;" %%i in (%input%) do (
	set gltf=%%i
	set glb=%%j
)

gltfpack.exe -noq -i "%gltf%" -o "%glb%"

for %%a in ("%gltf%") do set "folder=%%~dpa"
timeout /t 2 /nobreak > nul & rmdir /s /q "%folder%"




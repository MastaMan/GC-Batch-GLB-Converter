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

gltfpack.exe -cc -tc -tl 2048 -vpn -i "%gltf%" -o "%glb%"

for %%a in ("%gltf%") do set "folder=%%~dpa"
if not "%folder%"=="" (
	rmdir /s /q "%folder%"
)



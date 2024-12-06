:: Web Request
:: 1.0.0
:: Vasyl Lukianenko 
:: 3DGROUND
:: https://3dground.net

echo off
setlocal enabledelayedexpansion
cls

set input=%1

set url=
set out=

for /f "tokens=1,2 delims=;" %%i in (%input%) do (
	set url=%%i
	set out=%%j
)


c:\Windows\System32\curl.exe --progress-bar --ssl-no-revoke -m 36000 %url% -o "%out%"

:: Sync AWS
:: 1.0.0
:: Vasyl Lukianenko 
:: 3DGROUND
:: https://3dground.net

echo off
setlocal enabledelayedexpansion
cls

set input=%1

set dest=
set bucket=
set dt=

:: Get Date
for /f "skip=1 tokens=1" %%x in ('wmic os get LocalDateTime') do (
    set dt=%%x
    goto next
)
:next
set year=%dt:~0,4%
set month=%dt:~4,2%
set day=%dt:~6,2%
set hour=%dt:~8,2%
set minute=%dt:~10,2%
set second=%dt:~12,2%

for /f "tokens=1,2 delims=;" %%i in (%input%) do (
	set dest=%%i
	set bucket=%%j
)

cd C:\Program Files\Amazon\AWSCLIV2\
aws s3 cp "%dest%" s3://%bucket%/Converted/ --recursive > "c:\temp\aws_%day%.%month%.%year%_%hour%-%minute%-%second%.log"

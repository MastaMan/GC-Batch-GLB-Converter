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

for /f "tokens=1,2 delims=;" %%i in (%input%) do (
	set dest=%%i
	set bucket=%%j
)

cd C:\Program Files\Amazon\AWSCLIV2\
aws s3 cp "%dest%" s3://%bucket%/Converted/ --recursive --only-show-errors > "c:\temp\error-aws.log"

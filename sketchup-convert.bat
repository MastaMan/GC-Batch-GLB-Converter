:: Sketchup Converter
:: 1.0.0
:: Vasyl Lukianenko 
:: 3DGROUND
:: https://3dground.net

echo off

cls

set input=%1
set sketchup=
set vrscene=
set skp=
set script=c:\temp\sketchup_saver.rb

for /f "tokens=1,2,3 delims=;" %%i in (%input%) do (
	set sketchup=%%i
	set vrscene=%%j
	set skp=%%k
)

::Write Ruby Script
echo begin>%script%
echo model = Sketchup.active_model>>%script%
echo model.import("%vrscene%", show_summary: false)>>%script%
::echo view = model.active_view>>%script%
::echo view.zoom_extents>>%script%
echo model.save("%skp%")>>%script%
echo Sketchup.quit>>%script%
echo end>>%script%

::Run Sketchup
taskkill /F /IM SketchUp.exe
"%sketchup%" "C:\temp\template.skp" -RubyStartup "%script%" > log.txt
taskkill /F /IM BsSndRpt64.exe

del "%script%" /f /q

::exit 0
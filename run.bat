@echo off
setlocal enabledelayedexpansion

echo -
set current_path=%~dp0
echo - located here: %current_path%

echo - please input your text here, then save and close when finished.
"%current_path%input.txt"
echo - converting input into output...

set /a counter=0



(
echo ^<?xml version="1.0" encoding="utf-8"?^>
echo ^<resources^>
for /f "tokens=1,2 delims==" %%a in (%current_path%input.txt) do (
			set /a count=0
			
			for /f "tokens=1,2 delims==" %%i in (%current_path%compare.txt) do (
				if !counter!==!count! (
					echo|set /p= "<string name="%%i"
				)
				set /a count+=1
			)
			
			echo ">%%a</string>
		
			set /a counter +=1
)
			
echo ^</resources^>

)>"%current_path%output.txt"

echo - done.
"%current_path%output.txt"
pause
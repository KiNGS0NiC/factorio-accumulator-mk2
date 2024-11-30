@echo off
setlocal

set "name=accumulator-mk2"
set "version=1.0.0"
set "source_files=info.json data.lua thumbnail.png graphics.lua"
set "target_folder=target\%name%_%version%"
set "zip_file_name=%name%_%version%.zip"

if exist "%target_folder%\" (
    rmdir /s /q "%target_folder%"
)
mkdir "%target_folder%"

for %%f in (%source_files%) do (
    copy /y "%%f" "%target_folder%"
)
xcopy /E /I ".\locale" "%target_folder%\locale"
xcopy /E /I ".\graphics" "%target_folder%\graphics"

powershell -command "Compress-Archive -Path '%target_folder%' -DestinationPath '%target_folder%\%zip_file_name%'"

copy /y "%target_folder%\%zip_file_name%" "%appdata%\Factorio\mods"

endlocal
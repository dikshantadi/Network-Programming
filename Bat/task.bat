@echo off
set /p name=Enter your name:
mkdir %name%

if exist %name%(
    echo Folder created successfully.
) else (
    echo folder not created 
)
pause
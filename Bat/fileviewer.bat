@echo off
set /p file=Enter a file name:
if exist %file% (
    type %file%
) else (
    echo file not found
)
pause
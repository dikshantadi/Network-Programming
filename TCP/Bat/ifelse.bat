@echo off 
set /p number=Enter a number:
if %number%==1 (
    echo you entered one
) else if %number%==2 (
    echo you entered two
) else (
    echo you entered not one or two, here is the time %TIME%
)
pause


@echo off
setlocal enabledelayedexpansion

:info_menu
echo ==========================
echo System Information 
echo ==========================
echo 1. Date and Time
echo 2. Username
echo 3. Directory
echo 4. Operating System Information
echo 5. Exit
echo .

set /p info_choice=Enter your choice:

:info_choices

if "%info_choice%"=="1" (
    echo The current date and time is %DATE% %TIME%
    pause
    cls
    goto info_menu
)

if "%info_choice%"=="2" (
    echo The current username is %USERNAME%
    pause
    cls
    goto info_menu
)

if "%info_choice%"=="3" (
    echo The current Directory is %CD%
    pause
    cls
    goto info_menu
)

if "%info_choice%"=="4" (
    echo The System information is.... 
    systeminfo
    pause
    cls
    goto info_menu
)

if "%info_choice%"=="5" (
    echo Exiting...
    cls
    call main.bat
)

echo Invalid Choice, please try again
pause
goto info_menu

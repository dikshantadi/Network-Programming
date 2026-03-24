@echo off
setlocal 

:menu 
cls
echo ================================
echo         Main Menu
echo ================================
echo 1. File Operations
echo 2. System Information
echo 3. Backup Tools
echo 4. Network Tools
echo 5. Exit
echo . 

set /p choice=Enter your choice:

if "%choice%"=="1" (
    call files.bat
    goto menu
)

if "%choice%"=="2" (
    call info.bat
    goto menu
)

if "%choice%"=="3" (
    call backup.bat
    goto menu
)

if "%choice%"=="4" (
    call networking.bat
    goto menu
)

if "%choice%"=="5" (
    echo Exiting
    exit
)

echo Invalid choice, please try again
pause
goto menu 
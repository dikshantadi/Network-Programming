@echo off
setlocal enabledelayedexpansion

:menu 
cls 
echo ================================
echo         Main Menu
echo ================================
echo 1. Show Files
echo 2. Create Folder
echo 3. Show Date and Time
echo 4. Delete Folder
echo 5. Rename Folder
echo 6. Backup Folder
echo 7. Exit
echo . 

set /p choice=Enter your choice:

goto process_choice

:process_choice
if "%choice%"=="1" (
    echo Showing files in current directory:
    dir
    pause 
    goto menu
)

if "%choice%"=="2" (
    set /p folder=folder name:
    mkdir !folder!
    if exist !folder! (
        echo folder created successfully
    ) else (
        echo folder not created
    )
    pause
    goto menu
)

if "%choice%"=="3" (
    echo Current date and time is %DATE% %TIME%
    pause
    goto menu
)

if "%choice%"=="4" (
    set /p folder=folder name:
    rmdir /s /q !folder!
    if not exist !folder! (
        echo folder deleted successfully
    ) else (
        echo folder not deleted
    )
    pause
    goto menu
)

if "%choice%"=="5" (
    set /p oldname=old folder name:
    set /p newname=new folder name:
    ren !oldname! !newname!
    if exist !newname! (
        echo folder renamed successfully
    ) else (
        echo folder not renamed
    )
    pause
    goto menu
)

if "%choice%"=="6" (
    set /p folder=folder name:
    set /p backup=backup folder name:
    xcopy !folder! !backup! /E /I /H /Y
    if exist !backup! (
        echo folder 
        backed up successfully
    ) else (
        echo folder not backed up
    )
    pause
    goto menu
)

if "%choice%"=="7" (
    echo Exiting...
    exit
) 

:: If none of the above invalid choice
echo Invalid choice, please try again.
pause
goto menu 

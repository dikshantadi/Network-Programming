@echo off
setlocal enabledelayedexpansion

:Backup_menu
echo =========================
echo Backup Menu
echo =========================
echo 1. Backup a Folder
echo 2. Restore a Backup
echo 3. List Backups
echo 4. Delete Backup
echo 5. Auto Backup
echo 6. Exit
echo .

set /p backup_choice=Enter your choice:

:backup_choice

if "%backup_choice%"=="1" (
    set /p backup_file=Enter backup folder:
    set /p backup_destination=Enter backup destination:

    robocopy "!backup_file!" "!backup_destination!" /E /Z /R:2 /W:2
    echo Backup completed
    pause
    cls
    goto Backup_menu
)

if "%backup_choice%"=="2" (
    cls
    set /p backup_fold=Enter backup folder destination
    set /p backup_restore=Enter restore location
    if exist "!backup_fold!" (
        echo Restoring files...
        robocopy "!backup_fold!" "!backup_restore!" /E /Z /R:2 /W:2
        echo Restore completed!
    ) else (
        echo Backup folder not found!
    )

    pause
    cls
    goto Backup_menu
)

if "%backup_choice%"=="3" (
    set /p backup=Enter backup destination
    dir "!backup!"
    pause
    cls
    goto Backup_menu
)

if "%backup_choice%"=="4" (
    set /p backup_del=Enter backup folder to delete:
    rmdir /s /q "!backup_del!"
    echo folder deleted
    pause
    cls
    goto Backup_menu
)

if "%backup_choice%"=="5" (
    cls
    set /p source=Enter folder to backup:

    if not exist "!source!" (
        echo Source folder not found!
        pause
        goto backup_menu
    )

    for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set datetime=%%I

    set backup_name=backups\Backup_!datetime:~0,8!_!datetime:~8,6!

    mkdir "!backup_name!"

    echo Creating backup...
    robocopy "!source!" "!backup_name!" /E /Z /R:2 /W:2

    echo Backup created at "!backup_name!"
    
    pause
    cls
    goto Backup_menu
)

if "%backup_choice%"=="6" (
    echo Exiting....
    pause
    cls
    call main.bat
)

echo Invalid choice, try again
pause
goto backup_menu
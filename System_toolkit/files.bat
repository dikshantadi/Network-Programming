@echo off 
setlocal enabledelayedexpansion

:file_menu 

echo =======================
echo File menu
echo =======================
echo 1. Show Files
echo 2. Create Folder
echo 3. Delete Folder
echo 4. Rename Folder
echo 5. Create Files
echo 6. Delete Files
echo 7. Rename Files
echo 8. Go Inside Folder
echo 9. Exit
echo .

set /p file_choice=Enter your choice:

:File_choices

if "%file_choice%"=="1" (
    echo Showing files in current directory:
    dir
    pause
    cls
    goto file_menu
)

if "%file_choice%"=="2" (
    set /p file_name=Enter Folder name:
    mkdir !file_name!
    if exist !file_name! (
        echo folder created successfully
    ) else (
        echo folder not created
    )
    pause
    cls
    goto file_menu
)

if "%file_choice%"=="3" (
    set /p folder_name=Enter Folder name:
    rmdir /s /q !folder_name!
    if exist !folder_name! (
        echo folder not deleted
    ) else (
        echo folder deleted successfully
    )
    pause
    cls
    goto file_menu
)

if "%file_choice%"=="4" (
    set /p oldname=Enter old folder name:
    set /p newname=Enter new folder name:
    ren !oldname! !newname!
    if exist !newname! (
        echo folder renamed successfully
    ) else (
        echo folder not renamed
    )
    pause
    goto file_menu
)

if "%file_choice%"=="5" (
    set /p new_file_name=Enter file name:
    echo File Created > !new_file_name!
    if exist "!new_file_name!" (
    echo File created successfully
    ) else (
    echo Failed to create file
    )
    pause
    cls
    goto file_menu

)

if "%file_choice%"=="6" (
    set /p delete_file=Enter file you want to delete:
    if exist "!delete_file!" (
    del "!delete_file!"
    echo File "!delete_file!" deleted successfully.
    ) else (
        echo File "!delete_file!" not found!
    )
    pause
    cls
    goto file_menu
)

if "%file_choice%"=="7" (
    set /p old_name_file=Enter file you want to rename:
    set /p new_name_file=Enter new name for the file:
    ren !old_name_file! !new_name_file!
    if exist !new_name_file! (
        echo file renamed successfully
    ) else (
        echo file not renamed
    )
    pause
    cls
    goto file_menu 
)

if "%file_choice%"=="8" (
    echo Folder has 
    dir
    set /p direc=Enter where you want to go:
    cd /d "!direc!"
    pause
    goto file_menu
)

if "%file_choice%"=="9" (
    echo Exiting...
    cls
    call main.bat
)

echo Invalid choice, please try again
pause
goto file_menu 
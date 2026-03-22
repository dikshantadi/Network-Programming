@echo off
set username=admin
set password=1234
set attempts=0

:start
set /p user=Enter username:
set /p passw=Enter password:

if %user%==%username% (
    if %passw%==%password% (
        echo login successful
        goto end
    )
)

:increment_attempts
set /a attempts+=1
if %attempts% geq 3 (
    echo too many attempts, exiting
    goto end
) else (
    echo incorrect username or password, try again
    goto start
)

:end
pause
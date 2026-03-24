@echo off
setlocal enabledelayedexpansion

:network_menu
echo ===========================
echo Network Menu
echo ===========================
echo 1. Ip address
echo 2. Mac address
echo 3. Ping a host
echo 4. Traceroute
echo 5. Test Internet Connectivity
echo 6. Show Network Connection
echo 7. DNS Lookup
echo 8. Show Active Ports and Connection
echo 9. Exit

set /p net_choice=Enter your choice:

:networking_choice

if "%net_choice%"=="1" (
    echo ip address is :
    ipconfig | findstr /i "IPv4"
    pause
    cls
    goto network_menu
)

if "%net_choice%"=="2" (
    echo mac address is 
    getmac
    pause
    cls
    goto network_menu
)

if "%net_choice%"=="3" (
    set /p host=enter host ip
    ping !host!
    pause
    cls
    goto network_menu
)

if "%net_choice%"=="4" (
    set /p trace=Enter host to trace
    tracert !trace!
    pause
    cls
    goto network_menu
)

if "%net_choice%"=="5" (
    echo Testing internet by pinging
    ping google.com
    pause
    cls
    goto network_menu
)

if "%net_choice%"=="6" (
    netstat -an
    pause
    cls
    goto network_menu
)

if "%net_choice%"=="7" (
    set /p dns=Enter domain for lookup
    nslookup !dns!
    pause
    cls
    goto network_menu
)

if "%net_choice%"=="8" (
    netstat -an | findstr LISTENING
    pause
    cls
    goto network_menu
)

if "%net_choice%"=="9" (
    echo Exiting....
    call main.bat
    cls
)

echo Invalid choice, please try again later
pause
goto network_menu
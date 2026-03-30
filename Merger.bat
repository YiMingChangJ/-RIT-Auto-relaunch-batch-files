@echo off

set "CASE_FILE=C:\Users\ritserver\Desktop\RITC\Merger Arbitrage Case - practice.xlsx"
set "USER_LIST=C:\Users\ritserver\Desktop\RITC\Practice Userlist\Practice Userlist.xlsx"
set "PORT_CASE=16540"
set "PORT_API=16550"

:MonitorLoop
title RIT Server %PORT_CASE%
echo Launching Case on Port %PORT_CASE%...

:: start /wait is ESSENTIAL here. It pauses this script until the server crashes.
start /wait "Server %PORT_CASE%" "C:\Program Files (x86)\Rotman\RIT Instructor Application\Server.exe" -c "%CASE_FILE%" -u "%USER_LIST%" -p "%PORT_CASE%" -a "%PORT_API%"

:: ============================================================
:: CRASH DETECTED
:: ============================================================
echo.
echo ----------------------------------------------------------
echo CRITICAL WARNING: Server on port %PORT_CASE% crashed.
echo Crash Detected at: %date% %time%
echo ----------------------------------------------------------

echo %date% %time% : Port %PORT_CASE% crashed >> CrashLog.txt

echo Restarting in 5 seconds...
timeout /t 5
goto MonitorLoop
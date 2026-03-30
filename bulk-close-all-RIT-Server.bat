@ECHO OFF
SET /P confirm="Type YES to close all RIT 2.0 Server instances: "
IF "%confirm%"=="YES" (
TASKKILL /FI "WINDOWTITLE eq RIT 2.0 Server*" /F
) ELSE (
echo Nothing to do then.
)
PAUSE
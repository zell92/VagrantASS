@echo off

echo Restarting Vagrant VM...
vagrant reload

if errorlevel 1 (
	echo FAILURE! Vagrant VM unresponsive...
) else (
	echo Vagrant is restarted!
)

echo Press a key to continue...
pause > nul
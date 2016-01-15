@echo off
echo This assumes you have NodeJS with NPM installed.
echo If this script fails due to permission or other I/O errors, try running it again first.
echo If you don't have the right tools installed you can close this window. If you want to continue, press the any key.
REM Install GULP globally
cmd /c npm install gulp-cli -g
REM Install local dependencies
cmd /c npm install
pause
echo off

cls
odin version

set OUT_DIR=build\debug\windows\x86

echo create debug build directory if not exist
if exist %OUT_DIR% rmdir /s /q %OUT_DIR%
mkdir %OUT_DIR%
IF %ERRORLEVEL% NEQ 0 exit /b 1

echo create debug build
odin build test -out:%OUT_DIR%\test.exe -strict-style -vet o:speed
IF %ERRORLEVEL% NEQ 0 exit /b 1
echo Debug build created in %OUT_DIR%

echo start debug build
%OUT_DIR%\test.exe
echo.
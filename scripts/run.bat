@echo off
setlocal

for /f "delims=" %%A in ('cd') do (
    set PROJECT_NAME=%%~nxA
)

if not exist out\%PROJECT_NAME%.exe (
    echo Error: Nothing to run
    exit /b 1
)

cd out
%PROJECT_NAME%.exe

endlocal

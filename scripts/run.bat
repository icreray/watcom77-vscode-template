@echo off
setlocal

if [%1]==[] (
    echo Error: No file specified
    echo Usage: %~nx0 filename.for
    exit /b 1
)
if not "%~x1"==".for" (
    echo Error: File must have .for extension
    exit /b 1
)
if not exist %1 (
    echo Error: File not found: %1
    exit /b 1
)
for %%A in (%~1) do (
    set filename=%%~nA
)

if not exist out\%filename%.exe (
    echo Error: Nothing to run
    exit /b 1
)

set project_dir=%cd%
cd resources
%project_dir%/out/%filename%.exe

endlocal

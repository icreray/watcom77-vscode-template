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
    set input_file=%%~fA
    set filename=%%~nA
)
set project_dir=%cd%

rmdir /s /q %project_dir%\out\obj\
mkdir out\obj

<nul set /p "=Compiling %filename% "
wfl386 -c %input_file% -INCPath=%project_dir%\src -fo=%project_dir%\out\obj\%filename%.obj -Quiet > nul
if errorlevel 1 (
    echo - Failed:
    type %filename%.err
    del %filename%.err
    exit /b 1
) else (
    echo - Done
)


<nul set /p "=Linking object files "
wlink name %project_dir%\out\%filename%.exe file %project_dir%\out\obj\%filename%.obj > %project_dir%\out\link.log
if errorlevel 1 (
    echo - Failed:
    type %project_dir%\out\link.log
    del %project_dir%\out\link.log
    exit /b 1
) else (
    echo - Done
)
del %project_dir%\out\link.log

endlocal

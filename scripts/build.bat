@echo off
setlocal

for /f "delims=" %%A in ('cd') do (
    set PROJECT_NAME=%%~nxA
)
set PROJECT_DIR=%cd%

rmdir /s /q %PROJECT_DIR%\out\obj\
mkdir out\obj

for %%f in (%PROJECT_DIR%\src\*.for) do (
    <nul set /p "=Compiling %%~nxf "
    wfl386 -c %%f -INCPath=%PROJECT_DIR%\src -fo=%PROJECT_DIR%\out\obj\%%~nxf.obj -Quiet > nul
    if errorlevel 1 (
        echo - Failed:
        type %%~nf.err
        del %%~nf.err
        exit /b 1
    ) else (
        echo - Done
    )
)

<nul set /p "=Linking object files "
wlink name %PROJECT_DIR%\out\%PROJECT_NAME%.exe file %PROJECT_DIR%\out\obj\*.obj > %PROJECT_DIR%\out\link.log
if errorlevel 1 (
    echo - Failed:
    type %PROJECT_DIR%\out\link.log
    del %PROJECT_DIR%\out\link.log
    exit /b 1
) else (
    echo - Done
)
del %PROJECT_DIR%\out\link.log

endlocal

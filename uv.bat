@echo off
REM 这里把UV设置成Keil安装地址
set UV=C:\Keil_v5\UV4\UV4.exe

REM echo "get param %1"

REM if "%1" == "" goto NOP
REM keil项目文件地址
set UV_PRO_PATH=%cd%\proj\STM32F103C8T6.uvprojx

if exist "%UV_PRO_PATH%" (
    echo Detect project file "%UV_PRO_PATH%"
) else (
    goto end
)

if exist "%UV%" (
    echo Detect "%UV%"
) else (
    goto end
)

if "%1" == "-b" (
    echo Init building ...
    %UV% -j0 -b "%UV_PRO_PATH%" -l build_log.txt & type build_log.txt
) else if "%1" == "-f" (
    echo Init flashing ...
    %UV% -j0 -f %UV_PRO_PATH%
    type build_log.txt
) else if "%1" == "-cr" (
    echo Init flashing ...
    %UV% -j0 -cr %UV_PRO_PATH% -l build_log.txt & type build_log.txt
)

goto end

:NOP
echo No ProjectName
goto end

:end
REM sleep 5

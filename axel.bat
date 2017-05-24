@echo off

set PORXY=http://3.20.128.6:88

set BAT_HOME=%~dp0
set AXEL_EXE=%BAT_HOME%\axel.exe
set AXEL_LOG=%BAT_HOME%\axel.log
set AXEL_ERR=%BAT_HOME%\axel.err.log
set PASTE_EXE=%BAT_HOME%\paste.exe
set DOWNLOAD_HOME=%USERPROFILE%\Downloads
set SHORT_CUT=%USERPROFILE%\Desktop\Axel.lnk
If Not Exist %SHORT_CUT% %BAT_HOME%\XXMKLINK.EXE %USERPROFILE%\Desktop\Axel %BAT_HOME%\axel.bat "" %BAT_HOME% Axel 3 %BAT_HOME%\axel.ico

CD %DOWNLOAD_HOME%

call %BAT_HOME%curl.exe -s --connect-timeout 1 --proxy %PORXY% www.baidu.com  > NUL
If "%errorlevel%"=="0"  (
	set http_proxy=%PORXY%
	set https_proxy=%PORXY%
)


for /f "tokens=*" %%a in ('%PASTE_EXE%') do (
  echo Downloading %%a ...
  echo Downloading %%a >> %AXEL_LOG%
  %AXEL_EXE% -n 20 %%a  || (
	%BAT_HOME%curl.exe -L -O -k %%~a
  )  
)

start %DOWNLOAD_HOME%
pause
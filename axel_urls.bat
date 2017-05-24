rem set http_proxy=http://165.225.96.34:10015
rem set https_proxy=http://165.225.96.34:10015


set URLS=urls.txt

set PORXY=http://3.20.128.6:88


set BAT_HOME=%~dp0
set AXEL_EXE=%BAT_HOME%\axel.exe
set AXEL_LOG=%BAT_HOME%\axel.log
set PASTE_EXE=%BAT_HOME%\paste.exe
set DOWNLOAD_HOME=%USERPROFILE%\Downloads

CD %DOWNLOAD_HOME%

call %BAT_HOME%curl.exe -s --connect-timeout 1 --proxy %PORXY% www.baidu.com
if "%errorlevel%"=="0"  (
	set http_proxy=%PORXY%
	set https_proxy=%PORXY%
)


@echo off
for /f "tokens=*" %%a in (%BAT_HOME%%URLS%) do (
  echo Downloading %%a ...
  echo Downloading %%a >> %AXEL_LOG%
  %AXEL_EXE% -n 20 "%%a"
  If Not "%errorlevel%"=="0" (
	%BAT_HOME%curl.exe -L -O "%%a"
  )  
)


start %DOWNLOAD_HOME%
pause
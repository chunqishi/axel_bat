@echo off



set http_proxy=http://165.225.96.34:10015
set https_proxy=http://165.225.96.34:10015

set BAT_HOME=%~dp0
set AXEL_EXE=%BAT_HOME%\axel.exe
set PASTE_EXE=%BAT_HOME%\paste.exe
set DOWNLOAD_HOME=%USERPROFILE%\Downloads
set SHORT_CUT=%USERPROFILE%\Desktop\Axel.lnk
If Not Exist %SHORT_CUT% %BAT_HOME%\XXMKLINK.EXE %USERPROFILE%\Desktop\Axel %BAT_HOME%\axel.bat "" %BAT_HOME% Axel 3 %BAT_HOME%\axel.ico

CD %DOWNLOAD_HOME%

for /f "tokens=*" %%a in ('%PASTE_EXE%') do (
  echo Downloading %%a ...
  %AXEL_EXE% -n 20 "%%a"
)

start %DOWNLOAD_HOME%
pause
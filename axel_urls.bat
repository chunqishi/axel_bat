set http_proxy=http://165.225.96.34:10015
set https_proxy=http://165.225.96.34:10015

@echo off
for /f "tokens=*" %%a in (urls.txt) do (
  echo downloading %%a
  axel -n 20 "%%a"
)
pause
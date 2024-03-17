@echo off
set SCRIPT=%~1
set SCRIPT_NAME=%~n1
set SCRIPT_DIR=%~dp1

set SHORTCUT=%SCRIPT_DIR%%SCRIPT_NAME%.lnk
set SHORTCUT_VBS=%temp%\%SCRIPT_NAME%.vbs

if not exist "%SHORTCUT%" (
  echo Set oWS = WScript.CreateObject("WScript.Shell") > "%SHORTCUT_VBS%"
  echo sLinkFile = "%SHORTCUT%" >> "%SHORTCUT_VBS%"
  echo Set oLink = oWS.CreateShortcut(sLinkFile) >> "%SHORTCUT_VBS%"
  echo oLink.TargetPath = "%SCRIPT%" >> "%SHORTCUT_VBS%"
  echo oLink.Save >> "%SHORTCUT_VBS%"
  cscript /nologo "%SHORTCUT_VBS%"
  del "%SHORTCUT_VBS%"
)

powershell -Command "$s=(New-Object -COM WScript.Shell).CreateShortcut('%SHORTCUT%');$s.TargetPath='%SCRIPT%';$s.Save();$s.Arguments='%*';$s.Save();(New-Object -Com Shell.Application).Namespace('%APPDATA%\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar').ParseName('%SHORTCUT%').InvokeVerb('taskbarpin')"

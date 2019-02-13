echo off
set apath=%~dp0
echo "install net4.0"
%apath%\dotNetFx45_Full_x86_x64.exe  /quiet /norestart
start /w pkgmgr /iu:PowerShell
echo y|powershell set-executionpolicy remotesigned
echo "PowerShell 3.0"
%apath%\Windows6.1-KB2506143-x64.msu  -ArgumentList /quiet 
REG add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"  /v "ansible" /t REG_SZ /d "\"%apath%Powerl.bat\"" /f
echo PowerShell %apath%\ConfigureRemotingForAnsible.ps1>%apath%Powerl.bat
echo REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "ansible" /f >>%apath%Powerl.bat 
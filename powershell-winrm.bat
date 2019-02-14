powershell get-host
set-ExecutionPolicy RemoteSigned
echo y | winrm quickconfig 
winrm e winrm/config/listener
winrm set winrm/config/service/auth @{Basic="true"}
winrm set winrm/config/service @{AllowUnencrypted="true"}

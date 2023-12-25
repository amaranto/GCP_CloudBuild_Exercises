
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
Start-Sleep -Seconds 5
choco install nodejs -y
choco install jdk8 -y
choco install vscode -y
choco install git.install -y
$javaExecutable = get-childitem -Path "C:\Program Files\Java\" -Filter jdk1.8.0*
$javaPath = $javaExecutable.FullName
[Environment]::SetEnvironmentVariable("JAVA_HOME", $javaPath, [EnvironmentVariableTarget]::Machine)
[Environment]::SetEnvironmentVariable("Path", "$env:Path;$javaPath\bin", [EnvironmentVariableTarget]::Machine)
#choco install microsoft-office-deployment -y
Restart-Computer
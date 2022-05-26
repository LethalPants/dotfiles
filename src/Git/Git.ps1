function Set-Git-Configuration {
  Write-Host "Configuring Git..." -ForegroundColor "Green";
  git config --global init.defaultBranch "master";
  git config --global user.name $Config.GitUserName;
  git config --global user.email $Config.GitUserEmail;
  Write-Host "Git was successfully configured." -ForegroundColor "Green";
}

Write-Host "Installing git..." -ForegroundColor "Green";
choco install -y "git" --params "/NoAutoCrlf /WindowsTerminal /NoShellIntegration /SChannel";
refreshenv;


if (Get-Command 'git' -errorAction SilentlyContinue) {
  Write-Host "Git installed sucessfully" -ForegroundColor "Green";
}
else {
  Write-Host "Error";
  $GitPath = Join-Path -Path $env:ProgramFiles -ChildPath "Git" | Join-Path -ChildPath "cmd";
  $oldpath = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).path
  $newpath = "$oldpath;$GitPath"
  Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH -Value $newpath
  $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User") 
  Write-Host $env:Path
  if (Get-Command 'git' -errorAction SilentlyContinue) {
    Write-Host "Git installed sucessfully" -ForegroundColor "Green";
  } 
}

Set-Git-Configuration;
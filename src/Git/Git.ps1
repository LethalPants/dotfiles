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

try {
  if (Get-Command 'git') {
    Write-Host "Git installed sucessfully" -ForegroundColor "Green";
  }
}
catch {
  $GitPath = Join-Path -Path $env:ProgramFiles -ChildPath "Git" | Join-Path -ChildPath "cmd";
  $oldpath = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).path
  $newpath = "$oldpath;$GitPath"
  Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH -Value $newpath
  if (Get-Command 'git') {
    Write-Host "Git installed sucessfully" -ForegroundColor "Green";
  } 
}

Set-Git-Configuration;
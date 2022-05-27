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
 $count = 0;
 do {
    Write-Host "Updating Path variable" -ForegroundColor "Yellow";
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User");
    $count += 1;
  } while(-not (Get-Command 'git' -errorAction SilentlyContinue) -AND (count -lt 10));
  Write-Host $env:PATH;
  Write-Host "Git installed sucessfully" -ForegroundColor "Green";
}
refreshenv;

Set-Git-Configuration;

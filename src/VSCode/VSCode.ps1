function Set-VSCode-Configuration {
  $VSCodeSettingsPath = Join-Path -Path $env:appdata -ChildPath "Code" | Join-Path -ChildPath "User";
  $DotfilesVSCodeSettingsFolder = Join-Path -Path $DotfilesWorkFolder -ChildPath "VSCode";
  
  if (-not (Test-Path -Path $VSCodeSettingsPath)) {
    Write-Host "Configuring Visual Studio Code..." -ForegroundColor "Green";
    New-Item $VSCodeSettingsPath -ItemType directory;
  }

  Get-ChildItem -Path "${DotfilesVSCodeSettingsFolder}\*" -Include "*.json" -Recurse | Copy-Item -Destination $VSCodeSettingsPath;
}

choco install -y "vscode" --params "/NoDesktopIcon /NoQuicklaunchIcon";

refreshenv;


if (Get-Command 'code' -errorAction SilentlyContinue) {
  Write-Host "VSCode installed sucessfully" -ForegroundColor "Green";
}
else {
 $count = 0;
 do {
    Write-Host "Updating Path variable" -ForegroundColor "Yellow";
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User");
    $count += 1;
  } while(-not (Get-Command 'code' -errorAction SilentlyContinue) -AND (count -lt 10));
  Write-Host $env:PATH;
  Write-Host "VSCode installed sucessfully" -ForegroundColor "Green";
}
refreshenv;
Set-VSCode-Configuration;


code --install-extension "ms-vscode.atom-keybindings";
code --install-extension "ms-vscode-remote.remote-wsl";
code --install-extension "ms-vscode-remote.remote-containers";
code --install-extension "ms-vscode.powershell";
code --install-extension "ms-azuretools.vscode-docker";
code --install-extension "eamodio.gitlens";
code --install-extension "mhutchie.git-graph";
code --install-extension "vscodevim.vim";
code --install-extension "dbaeumer.vscode-eslint";
code --install-extension "esbenp.prettier-vscode";
code --install-extension "VisualStudioExptTeam.vscodeintellicode";
code --install-extension "formulahendry.auto-rename-tag";
code --install-extension "aaron-bond.better-comments";
code --install-extension "davidanson.vscode-markdownlint";
code --install-extension "christian-kohler.path-intellisense";
code --install-extension "christian-kohler.npm-intellisense";
code --install-extension "streetsidesoftware.code-spell-checker";
code --install-extension "Gruntfuggly.todo-tree";
code --install-extension "GitHub.github-vscode-theme";
code --install-extension "pkief.material-icon-theme";

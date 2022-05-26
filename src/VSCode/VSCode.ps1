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
  $VscodePath = Join-Path -Path $env:ProgramFiles -ChildPath "Microsoft VS Code" | Join-Path -ChildPath "bin";
  $oldpath = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).path
  $newpath = "$oldpath;$VscodePath"
  Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH -Value $newpath
  if (Get-Command 'code' -errorAction SilentlyContinue) {
    Write-Host "VSCode installed sucessfully" -ForegroundColor "Green";
  } 
}

Set-VSCode-Configuration;
refreshenv;

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

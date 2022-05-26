$GitHubRepositoryAuthor = "LethalPants";
$GitHubRepositoryName = "dotfiles";

$GitHubRepositoryUri = "https://github.com/${GitHubRepositoryAuthor}/${GitHubRepositoryName}/archive/refs/heads/master.zip";


$DotfilesFolder = Join-Path -Path $HOME -ChildPath ".dotfiles";
$DotfilesWorkFolder = Join-Path -Path $DotfilesFolder -ChildPath "${GitHubRepositoryName}-new-dotfiles" | Join-Path -ChildPath "src";
$DotfilesHelpersFolder = Join-Path -Path $DotfilesWorkFolder -ChildPath "helpers";
$DotfilesConfigFile = Join-Path -Path $DotfilesFolder -ChildPath "${GitHubRepositoryName}-new-dotfiles" | Join-Path -ChildPath "config.json";


Write-Host "Running dotfiles setup..." -ForegroundColor "Yellow";
Write-Host "Please don't use your device while the script is running..." -ForegroundColor "Yellow";

Write-Host "Loading helpers..." -ForegroundColor "Green";
$DotfilesHelpers = Get-ChildItem -Path "${DotfilesHelpersFolder}\*" -Include *.ps1 -Recurse;
foreach ($DotfilesHelper in $DotfilesHelpers) {
  . $DotfilesHelper;
};

# Save user configuration in persistence
Set-Configuration-File -DotfilesConfigFile $DotfilesConfigFile -ComputerName $ComputerName -GitUserName $GitUserName -GitUserEmail $GitUserEmail -WorkspaceDisk $WorkspaceDisk;

# Load user configuration from persistence
$Config = Get-Configuration-File -DotfilesConfigFile $DotfilesConfigFile;

# Set alias for HKEY_CLASSES_ROOT
Set-PSDrive-HKCR;

# Register the script to start after reboot
Register-DotfilesScript-As-RunOnce;

# Run scripts
Invoke-Expression (Join-Path -Path $DotfilesWorkFolder -ChildPath "Chocolatey" | Join-Path -ChildPath "Chocolatey.ps1");
Invoke-Expression (Join-Path -Path $DotfilesWorkFolder -ChildPath "Fonts" | Join-Path -ChildPath "Fonts.ps1");
Invoke-Expression (Join-Path -Path $DotfilesWorkFolder -ChildPath "VSCode" | Join-Path -ChildPath "VSCode.ps1");
Invoke-Expression (Join-Path -Path $DotfilesWorkFolder -ChildPath "Vim" | Join-Path -ChildPath "Vim.ps1");
Invoke-Expression (Join-Path -Path $DotfilesWorkFolder -ChildPath "AutoHotKey" | Join-Path -ChildPath "ahk.ps1");
Invoke-Expression (Join-Path -Path $DotfilesWorkFolder -ChildPath "Git" | Join-Path -ChildPath "Git.ps1");
Invoke-Expression (Join-Path -Path $DotfilesWorkFolder -ChildPath "Docker" | Join-Path -ChildPath "Docker.ps1");
Invoke-Expression (Join-Path -Path $DotfilesWorkFolder -ChildPath "WSL" | Join-Path -ChildPath "WSL.ps1");
Invoke-Expression (Join-Path -Path $DotfilesWorkFolder -ChildPath "WorkspaceFolder" | Join-Path -ChildPath "WorkspaceFolder.ps1");
Invoke-Expression (Join-Path -Path $DotfilesWorkFolder -ChildPath "WindowsTerminal" | Join-Path -ChildPath "WindowsTerminal.ps1");
Invoke-Expression (Join-Path -Path $DotfilesWorkFolder -ChildPath "Windows" | Join-Path -ChildPath "Windows.ps1");

# Clean
# Unregister script from RunOnce
Remove-DotfilesScript-From-RunOnce;

Write-Host "Cleaning Dotfiles workspace..." -ForegroundColor "Green";
Remove-Item $DotfilesFolder -Recurse -Force -ErrorAction SilentlyContinue;

Write-Host "The process has finished." -ForegroundColor "Yellow";

Write-Host "Restarting the PC in 10 seconds..." -ForegroundColor "Green";
Start-Sleep -Seconds 10;
Restart-Computer;
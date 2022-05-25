function Copy-Startup-File {

  $MainStartupFile = Join-Path -Path $DotfilesWorkFolder -ChildPath "AutoHotKey" | Join-Path -ChildPath "startup.ahk";
  $StarupFileDestination = Join-Path -Path $env:APPDATA -ChildPath "Microsoft" | Join-Path -ChildPath "Windows" | Join-Path -ChildPath "Start Menu" | Join-Path -ChildPath "Programs" | Join-Path -ChildPath "Startup" | Join-Path -ChildPath "startup.ahk";
  Write-Host "Moving startup file..." -ForegroundColor "Green";
  Copy-Item $MainStartupFile -Destination $StarupFileDestination;
  Write-Host "Startup File was configured successfully." -ForegroundColor "Green";
}
 
Write-Host "Installing AutoHotkey..." -ForegroundColor "Green";
Copy-Startup-File
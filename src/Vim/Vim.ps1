function Set-Vim-Configuration {

  $MainVimrcPath = Join-Path -Path $DotfilesWorkFolder -ChildPath "Vim" | Join-Path -ChildPath "main.vimrc";
  $VimrcPath = Join-Path -Path $HOME -ChildPath ".vimrc";


  Write-Host "Copying final Vim configuration file:" -ForegroundColor "Green";
  Copy-Item $MainVimrcPath -Destination $VimrcPath;

  (Get-Content -path $VimrcPath) -replace "__VIMRC_LOCAL__", "~/vimfiles/local_init.vim" | Set-Content -Path $VimrcPath;

  Write-Host "Vim was successfully configured." -ForegroundColor "Green";
}

choco install -y "vim" --params "/NoDesktopShortcuts /NoContextmenu /InstallDir:${env:ProgramFiles}";
refreshenv;
Set-Vim-Configuration;
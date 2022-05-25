function Invoke-Install-File {
  $InstallFilePath = Join-Path -Path $DotfilesWorkFolder -ChildPath "WSL" | Join-Path -ChildPath "install.sh";
  $InstallWSLFilePath = wsl wslpath $InstallFilePath.Replace("\", "\\");
  Write-Host "Running install script..." -ForegroundColor "Green"
  wsl bash $InstallWSLFilePath;

}

function Set-Git-Configuration-In-Ubuntu {
  Write-Host "Configuring Git in Ubuntu..." -ForegroundColor "Green";
  wsl git config --global init.defaultBranch "main";
  wsl git config --global user.name $Config.GitUserName;
  wsl git config --global user.email $Config.GitUserEmail;
  wsl git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager-core.exe";
  wsl git config --list;
  Write-Host "Git was successfully configured in Ubuntu." -ForegroundColor "Green";
}

function Copy-Vimrc-In-Ubuntu {
  $DotfilesFinalVimrcPath = Join-Path -Path $DotfilesWorkFolder -ChildPath "Vim" | Join-Path -ChildPath "main.vimrc";
  $WslVimrcPath = wsl wslpath $DotfilesFinalVimrcPath.Replace("\", "\\");

  Write-Host "Copying Vim configuration file in Ubuntu..." -ForegroundColor "Green";

  wsl cp -R $WslVimrcPath ~/.vimrc;

  $WindowsVimrcPath = wsl wslpath -w ~/.vimrc;

  # Convert token strings
  (Get-Content -path $WindowsVimrcPath) -replace "__VIMRC_LOCAL__", "~/.vimrc.local" | Set-Content -Path $WindowsVimrcPath;

  # Convert line endings to Linux (CRLF -> LF)
  ((Get-Content $WindowsVimrcPath) -join "`n") + "`n" | Set-Content -NoNewline $WindowsVimrcPath;
}


function Install-OhMyZsh-Functions-In-Ubuntu {
  $DotfilesOhMyZshFunctionsPath = Join-Path -Path $DotfilesWorkFolder -ChildPath "WSL" | Join-Path -ChildPath "custom-actions.sh";
  $WslOhMyZshFunctionsPath = wsl wslpath $DotfilesOhMyZshFunctionsPath.Replace("\", "\\");

  Write-Host "Installing custom alias and functions for Oh My Zsh in Ubuntu..." -ForegroundColor "Green";

  wsl mkdir -p ~/.oh-my-zsh/custom/functions;

  wsl cp -R $WslOhMyZshFunctionsPath ~/.oh-my-zsh/custom/functions;
}

function Set-OhMyZsh-Configuration-In-Ubuntu {
  $DotfilesZshrcPath = Join-Path -Path $DotfilesWorkFolder -ChildPath "WSL" | Join-Path -ChildPath ".zshrc";
  $WslZshrcPath = wsl wslpath $DotfilesZshrcPath.Replace("\", "\\");

  Write-Host "Configuring Zsh in Ubuntu..." -ForegroundColor "Green";
  
  wsl cp -R $WslZshrcPath ~;
}

function Set-Zsh-As-Default-In-Ubuntu {
  Write-Host "Changing default shell to Zsh in Ubuntu..." -ForegroundColor "Green";

  $WslZshPath = wsl which zsh;
  wsl sudo chsh -s $WslZshPath;
}
function Install-Starship-In-Ubuntu {
  Write-Host "Installing the startship prompt..." -ForegroundColor "Green";
  wsl sudo curl -sS https://starship.rs/install.sh | sh
}

function Set-Starship-Configuration-In-Ubuntu {
  $DotfilesOhMyZshFunctionsPath = Join-Path -Path $DotfilesWorkFolder -ChildPath "WSL" | Join-Path -ChildPath "startship.toml";
  $WslOhMyZshFunctionsPath = wsl wslpath $DotfilesOhMyZshFunctionsPath.Replace("\", "\\");

  Write-Host "Installing starship prompt configuration..." -ForegroundColor "Green";

  wsl mkdir -p ~/.config;
  wsl cp -R $WslOhMyZshFunctionsPath ~/.config;
  wsl export STARSHIP_CONFIG=~/.config/starship.toml
}

Write-Host "Enabling WSL..." -ForegroundColor "Green";
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux;
Write-Host "Installing Ubuntu 20.04..." -ForegroundColor "Green";

dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart;
dism.exe /online /enable-feature /featurename:HypervisorPlatform /all /norestart;
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux;

wsl --install -d Ubuntu-20.04;
Start-Sleep -Seconds 50;
Write-Host "Ubuntu Install Successful." -ForegroundColor "Green";

Invoke-Install-File;
Set-Git-Configuration-In-Ubuntu;
Copy-Vimrc-In-Ubuntu;
Install-OhMyZsh-Functions-In-Ubuntu;
Set-OhMyZsh-Configuration-In-Ubuntu;
Set-Starship-Configuration-In-Ubuntu
Set-Zsh-As-Default-In-Ubuntu;
wsl --setdefault Ubuntu-20.04;
function Move-Ubuntu-To-Drive {
  if ($Config.MoveWSL -eq "Y") {
    Invoke-Expression (Invoke-RestMethod -Uri "https://raw.githubusercontent.com/pxlrbt/move-wsl/master/move-wsl.ps1");
  }
}

function Update-Ubuntu-Packages-Repository {
  Write-Host "Updating Ubuntu package repository..." -ForegroundColor "Green";
  wsl sudo apt --yes update;
}

function Update-Ubuntu-Packages {
  Write-Host "Upgrading Ubuntu packages..." -ForegroundColor "Green";
  wsl sudo apt --yes upgrade;
}

function Install-Ubuntu-Package {
  [CmdletBinding()]
  param(
    [Parameter(Position = 0, Mandatory = $TRUE)]
    [string]
    $PackageName
  )

  Write-Host "Installing ${PackageName} in Ubuntu:" -ForegroundColor "Green";
  wsl sudo apt install --yes --no-install-recommends $PackageName;
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

function Install-VSCode-Extensions-In-WSL {
  Write-Host "Installing Visual Studio Code extensions in WSL..." -ForegroundColor "Green";

  wsl code --install-extension "ms-azuretools.vscode-docker";
  wsl code --install-extension "eamodio.gitlens";
  wsl code --install-extension "mhutchie.git-graph";
  wsl code --install-extension "dbaeumer.vscode-eslint";
  wsl code --install-extension "esbenp.prettier-vscode";
  wsl code --install-extension "VisualStudioExptTeam.vscodeintellicode";
  wsl code --install-extension "davidanson.vscode-markdownlint";
  wsl code --install-extension "christian-kohler.path-intellisense";
  wsl code --install-extension "christian-kohler.npm-intellisense";
  wsl code --install-extension "streetsidesoftware.code-spell-checker";
  wsl code --install-extension "Gruntfuggly.todo-tree";
}

function Install-Volta-In-Ubuntu {
  $DotfilesVoltaInstallerPath = Join-Path -Path $DotfilesWorkFolder -ChildPath "WSL" | Join-Path -ChildPath "volta.sh";

  Invoke-WebRequest -o $DotfilesVoltaInstallerPath https://get.volta.sh;

  $WslVoltaInstallerPath = wsl wslpath $DotfilesVoltaInstallerPath.Replace("\", "\\");

  Write-Host "Installing Volta in Ubuntu..." -ForegroundColor "Green";
  
  wsl bash $WslVoltaInstallerPath;
}

function Install-Nodejs-Packages-In-Ubuntu {
  Write-Host "Installing Node.js LTS in Ubuntu..." -ForegroundColor "Green";
  wsl ~/.volta/bin/volta install node;
  
  Write-Host "Installing NPM in Ubuntu..." -ForegroundColor "Green";
  wsl ~/.volta/bin/volta install npm;
  
  Write-Host "Installing Yarn in Ubuntu..." -ForegroundColor "Green";
  wsl ~/.volta/bin/volta install yarn;
  
  Write-Host "Installing TypeScript in Ubuntu..." -ForegroundColor "Green";
  wsl ~/.volta/bin/volta install typescript;
  
  Write-Host "Installing Yarn-Upgrade-All in Ubuntu..." -ForegroundColor "Green";
  wsl ~/.volta/bin/volta install yarn-upgrade-all;
}

function Install-Golang-In-Ubuntu {
  Write-Host "Installing Golang in Ubuntu..." -ForegroundColor "Green";
  wsl sudo apt install --yes --no-install-recommends golang-go;
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

function Install-OhMyZsh-In-Ubuntu {
  $DotfilesOhMyZshInstallerPath = Join-Path -Path $DotfilesWorkFolder -ChildPath "WSL" | Join-Path -ChildPath "ohmyzsh.sh";

  Invoke-WebRequest -o $DotfilesOhMyZshInstallerPath https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh;

  $WslOhMyZshInstallerPath = wsl wslpath $DotfilesOhMyZshInstallerPath.Replace("\", "\\");
  
  Write-Host "Installing Oh My Zsh in Ubuntu..." -ForegroundColor "Green";
  
  wsl bash $WslOhMyZshInstallerPath --unattended;
}

function Install-Zsh-Autosuggestions {
  $ZshAutosuggestionsWslPath = "~/.oh-my-zsh/custom/plugins/zsh-autosuggestions";

  Write-Host "Installing Zsh-Autosuggestions in Ubuntu:" -ForegroundColor "Green";

  wsl rm -rf $ZshAutosuggestionsWslPath;

  wsl git clone https://github.com/zsh-users/zsh-autosuggestions $ZshAutosuggestionsWslPath;
}

function Install-Zsh-SyntaxHighlighting {
  $ZshSyntaxHighlightingWslPath = "~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting";

  Write-Host "Installing Zsh-SyntaxHighlighting in Ubuntu..." -ForegroundColor "Green";

  wsl rm -rf $ZshSyntaxHighlightingWslPath;

  wsl git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZshSyntaxHighlightingWslPath;
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

dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart;
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux;
wsl --set-default-version 2;
wsl --install -d Ubuntu-20.04;
wsl --setdefault Ubuntu-20.04 ;

Move-Ubuntu-To-Drive;
wsl echo 'nameserver 8.8.8.8' | sudo tee -a /etc/resolv.conf;
Update-Ubuntu-Packages-Repository;
Update-Ubuntu-Packages;

Install-Ubuntu-Package -PackageName "zsh";
Install-Ubuntu-Package -PackageName "git";
Install-Ubuntu-Package -PackageName "curl";
Install-Ubuntu-Package -PackageName "neofetch";
Install-Ubuntu-Package -PackageName "vim";
Install-Ubuntu-Package -PackageName "g++";
Install-Ubuntu-Package -PackageName "gcc";

Set-Git-Configuration-In-Ubuntu;

Install-VSCode-Extensions-In-WSL;

Install-Volta-In-Ubuntu;
Install-Nodejs-Packages-In-Ubuntu;

Install-Golang-In-Ubuntu;

Copy-Vimrc-In-Ubuntu;

Install-OhMyZsh-In-Ubuntu;
Install-OhMyZsh-Functions-In-Ubuntu;
Install-Zsh-Autosuggestions
Install-Zsh-SyntaxHighlighting
Set-OhMyZsh-Configuration-In-Ubuntu;
Set-Zsh-As-Default-In-Ubuntu;
Install-Starship-In-Ubuntu;
Set-Starship-Configuration-In-Ubuntu
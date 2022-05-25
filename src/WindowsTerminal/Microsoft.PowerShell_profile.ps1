################################################################################
#                                Initial Commands                              #
################################################################################

Clear-Host;

################################################################################
#                        WindowsTerminal Profile Aliases                       #
################################################################################

function Invoke-Edit-WindowsTerminal-Profile {
  vim $PROFILE;
};
Set-Alias -Name "edt" -Value "Invoke-Edit-WindowsTerminal-Profile";

function Invoke-Refresh-WindowsTerminal-Profile {
  . $PROFILE;
};
Set-Alias -Name "src" -Value "Invoke-Refresh-WindowsTerminal-Profile";


################################################################################
#                          System Maintenance Aliases                          #
################################################################################

function Update-System {
  Update-Module;
  Update-Help -Force;
  choco upgrade -y "chocolatey";
  choco upgrade -y all --execution-timeout 7200;
  wsl sudo apt --yes update;
  wsl sudo apt --yes upgrade;
};
Set-Alias -Name "updsys" -Value "Update-System";

################################################################################
#                                  Vim Aliases                                 #
################################################################################

function Invoke-Edit-Vimrc {
  vim ~/.vimrc;
};
Set-Alias -Name "editvim" -Value "Invoke-Edit-Vimrc";


# Starship Prompt
Invoke-Expression (&starship init powershell)
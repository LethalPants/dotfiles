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
#                         Environment Variables Aliases                        #
################################################################################

function Invoke-List-Path {
  $env:Path -split ';';
};
Set-Alias -Name "pathl" -Value "Invoke-List-Path";

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
#                                  Git Aliases                                 #
################################################################################

function Invoke-Git-Super-Clone {
  param($repositoryName);
  $folderName = $repositoryName.Split("/")[-1].Replace(".git", "")
  & git clone $repositoryName $folderName | Out-Null;
  Set-Location $folderName;
  git submodule init;
  git submodule update;
};
Set-Alias -Name "gsc" -Value "Invoke-Git-Super-Clone";

function Invoke-Git-Checkout-Branch {
  param($branchName);

  git checkout -b $branchName;
};
Set-Alias -Name "gcb" -Value "Invoke-Git-Checkout-Branch";

function Invoke-Git-Add {
  param($fileToAdd);

  git add $fileToAdd;
};
Set-Alias -Name "ga" -Value "Invoke-Git-Add";

function Invoke-Git-Add-All {
  git add --all;
};
Set-Alias -Name "gaa" -Value "Invoke-Git-Add-All";

function Invoke-Git-Status {
  git status -s;
};
Set-Alias -Name "gss" -Value "Invoke-Git-Status";

function Invoke-Git-Commit-Message {
  param($message);

  git commit -m $message;
};
Set-Alias -Name "gcmsg" -Value "Invoke-Git-Commit-Message";

function Invoke-Git-Push-Origin {
  param($branch);

  git push origin $branch;
};
Set-Alias -Name "gpsh" -Value "Invoke-Git-Push-Origin";

function Invoke-Git-Log {
  git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches;
};
Set-Alias -Name "glog" -Value "Invoke-Git-Log";

function Invoke-Git-Soft-Reset-Last-Commit {
  git reset --soft HEAD^1;
};
Set-Alias -Name "gsrlc" -Value "Invoke-Git-Soft-Reset-Last-Commit";

function Invoke-Git-Hard-Reset-Last-Commit {
  git reset --hard HEAD~1;
};
Set-Alias -Name "ghrlc" -Value "Invoke-Git-Hard-Reset-Last-Commit";
################################################################################
#                                  Vim Aliases                                 #
################################################################################

function Invoke-Edit-Vimrc {
  vim ~/.vimrc;
};
Set-Alias -Name "editvim" -Value "Invoke-Edit-Vimrc";


# Starship Prompt
Invoke-Expression (&starship init powershell)
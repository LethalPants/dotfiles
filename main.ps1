<#
  This file downloads the LethalPants/dotfiles repository to $HOME and executes the setup file in src folder.
 #>
$GitHubRepositoryAuthor = "LethalPants";
$GitHubRepositoryName = "dotfiles";
$GitHubRepositoryUri = "https://github.com/${GitHubRepositoryAuthor}/${GitHubRepositoryName}/archive/refs/heads/master.zip";

$DotfilesFolder = Join-Path -Path $HOME -ChildPath ".dotfiles";
$ZipRepositoryFile = Join-Path -Path $DotfilesFolder -ChildPath "dotfiles-master.zip";
$DotfilesWorkFolder = Join-Path -Path $DotfilesFolder -ChildPath "dotfiles-master" | Join-Path -ChildPath "src";

$DownloadResult = $FALSE;

# Request custom values
$ComputerName = Read-Host -Prompt "Input the new computer name here";
$GitUserName =  Read-Host -Prompt "Input your Git user name here - ";
$GitUserEmail = Read-Host -Prompt "Input your Git user email here - ";

$ValidDisks = Get-PSDrive -PSProvider "FileSystem" | Select-Object -ExpandProperty "Root";
do {
  Write-Host "Choose the location of your development workspace:" -ForegroundColor "Green";
  Write-Host $ValidDisks -ForegroundColor "Green";
  $WorkspaceDisk = Read-Host -Prompt "Please choose one of the available disks";
}
while (-not ($ValidDisks -Contains $WorkspaceDisk));

# Create Dotfiles folder
if (Test-Path $DotfilesFolder) {
  Remove-Item -Path $DotfilesFolder -Recurse -Force;
}
New-Item $DotfilesFolder -ItemType directory;

Try {
  Invoke-WebRequest $GitHubRepositoryUri -O $ZipRepositoryFile;
  $DownloadResult = $TRUE;
}
catch [System.Net.WebException] {
  Write-Host "Error connecting to GitHub, check the internet connection or the repository url." -ForegroundColor "Red";
}

if ($DownloadResult) {
  Add-Type -AssemblyName System.IO.Compression.FileSystem;
  [System.IO.Compression.ZipFile]::ExtractToDirectory($ZipRepositoryFile, $DotfilesFolder);
  Invoke-Expression (Join-Path -Path $DotfilesWorkFolder -ChildPath "setup.ps1");
}
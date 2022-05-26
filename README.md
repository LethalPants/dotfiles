# Dotfiles for Windows 11

My dotfiles to setup a dev environment on Windows 11 with scripts.
It contains installation and configuration of the tools listed below.

## Usage

Open powershell as administrator and run the following

```Powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass;
Invoke-Expression (Invoke-RestMethod -Uri "https://raw.githubusercontent.com/LethalPants/dotfiles/master/main.ps1");
```

## Contents

This `main.ps1` script will ask for your account details and setup the dev environment with following:

1. Install Chocolatey
   1.1. Configure Chocolatey to remember installation arguments for future updates.
2. Install Hack Nerd Font.
3. Install VSCode
   1. Install VSCode extensions
   2. Configure VSCode settings
4. Install vim
   1. Configure vim with settings from `main.vimrc`
5. Copy AutoHotkey startup file to the Windows Startup folder
   - _Note: You will need to manually install AutoHotkey from - <https://www.autohotkey.com/>_
6. Install Git on Windows
   1. Configure git with user provided details
7. Install Docker Desktop
8. Enable Windows Subsystem for Linux.
9. Install Ubuntu 20.04 LTS in WSL.

   1. Update nameservers for WSL
   2. Install curl
   3. Install ZSH
   4. Install neofetch
   5. Install git
   6. Install vim
   7. Install g++ & gcc
   8. Install GoLang
   9. Install Visual Studio Code extensions in Ubuntu.
   10. Install Volta in Ubuntu.
       1. Install Node.js LTS using Volta in Ubuntu.
       2. Install NPM using Volta in Ubuntu.
       3. Install Yarn using Volta in Ubuntu.
       4. Install TypeScript using Volta in Ubuntu.
       5. Install Yarn-Upgrade-All using Volta in Ubuntu.
   11. Install OhMyZSH
   12. Install Zsh-SyntaxHighlighting
   13. Install Zsh-Autosuggestions
   14. Install starship prompt
   15. Configure Vim in WSL
   16. Configure Git in WSL
   17. Configure ZSH in WSL
   18. Configure Starship in WSL

10. Setup workspace folders
11. Install Starship prompt in Windows
12. Configure Powershell profile
13. Configure Windows Terminal settings
14. Microsoft Windows optional features:
    1. Disable Windows Media Player.
    2. Disable Internet Explorer.
    3. Disable Microsoft XPS Document Writer.
    4. Disable WorkFolders Client.
    5. Enable Windows Sandbox.
15. Configure Windows 11 regional format.
16. Rename and restart PC

## Windows Terminal Custom Keyboard Shortcuts

| Action                            | Keyboard Shortcut |
| --------------------------------- | ----------------- |
| Open New Tab                      | ctrl+t            |
| Close Current Pane                | ctrl+w            |
| Open New Split Pane in Horizontal | alt+shift+h       |
| Open New Split Pane in Vertical   | alt+shift+v       |

## Alias and functions for PowerShell & Zsh

### Terminal Profile

| Alias | Description              | PowerShell | Zsh |
| ----- | ------------------------ | ---------- | --- |
| edt   | Edit terminal profile    | ✅         | ✅  |
| src   | Refresh terminal profile | ✅         | ✅  |

### System Maintenance

| Alias  | Description             | PowerShell | Zsh |
| ------ | ----------------------- | ---------- | --- |
| updsys | Update apps and system. | ✅         | ✅  |

### Environment Variables

| Alias | Description                                    | PowerShell | Zsh |
| ----- | ---------------------------------------------- | ---------- | --- |
| pathl | List the content of PATH environment variables | ✅         | ✅  |

### Git

| Alias | Description                                                      | PowerShell | Zsh |
| ----- | ---------------------------------------------------------------- | ---------- | --- |
| gcb   | git checkout creating new branch                                 | ✅         | ✅  |
| ga    | git add                                                          | ✅         | ✅  |
| gaa   | git add all                                                      | ✅         | ✅  |
| gsc   | git clone, load submodules and navigate to the repository folder | ✅         | ✅  |
| gss   | git status                                                       | ✅         | ✅  |
| gcm   | git commit message                                               | ✅         | ✅  |
| gpsh  | git push origin current_branch                                   | ✅         | ✅  |
| glog  | git log                                                          | ✅         | ✅  |
| gsrlc | Git soft reset last commit                                       | ✅         | ✅  |
| ghrlc | Git hard reset last commit                                       | ✅         | ✅  |

### Vim

| Alias     | Description               | PowerShell | Zsh |
| --------- | ------------------------- | ---------- | --- |
| editvim   | Edit .vimrc file          | ✅         | ✅  |
| sourcevim | Refresh Vim configuration |            | ✅  |

### Go

| Alias | Description           | PowerShell | Zsh |
| ----- | --------------------- | ---------- | --- |
| gmi   | Initialize Go modules |            | ✅  |

### Web search from the console

| Alias         | Example                    | PowerShell | Zsh |
| ------------- | -------------------------- | ---------- | --- |
| bing          | bing "Windows 11"          |            | ✅  |
| google        | google "Windows 11"        |            | ✅  |
| duckduckgo    | duckduckgo "Windows 11"    |            | ✅  |
| youtube       | youtube "Windows 11"       |            | ✅  |
| github        | github "Windows 11"        |            | ✅  |
| stackoverflow | stackoverflow "Windows 11" |            | ✅  |

## Credits

Thanks to JMOrbegoso for [Dotfiles-for-Windows-11](https://github.com/JMOrbegoso/Dotfiles-for-Windows-11)

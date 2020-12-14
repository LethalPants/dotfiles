
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Remap hotkeys
CapsLock::Esc
Esc::CapsLock

; Global hotkeys
#n::Run, explorer.exe \\wsl$\Ubuntu-20.04\home\hatim
#e::Run, explorer.exe
#t::Run, C:\Users\Hatim\AppData\Local\Microsoft\WindowsApps\wt.exe
#w::Run firefox.exe
#+w::Run firefox.exe -incognito

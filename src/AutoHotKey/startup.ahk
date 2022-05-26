#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; Global hotkeys
#n::Run, explorer.exe \\wsl$\Ubuntu-20.04\home\hatim
#e::Run, explorer.exe
#t::Run, C:\Users\Hatim\AppData\Local\Microsoft\WindowsApps\wt.exe
#q::Run firefox.exe

; Google Search
^+c::
{
 Send, ^c
 Sleep 50
 Run, http://www.google.com/search?q=%clipboard%
 Return
}
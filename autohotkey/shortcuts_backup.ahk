SwitchTo(programName) {
  WinGet, windowHandleId, ID, ahk_exe %programName%
  windowExistsAlready := windowHandleId > 0

  ; If the programName is already open, determine if we should put it in focus or minimize it.
  if (windowExistsAlready = true) {
    activeWindowHandleId := WinExist("A")
    windowIsAlreadyActive := activeWindowHandleId == windowHandleId

    if (windowIsAlreadyActive) {
      ; Minimize the window.
      WinMinimize, "ahk_id %windowHandleId%"
    }
    else {
      ; Put the window in focus.
      WinActivate, "ahk_id %windowHandleId%"
      WinShow, "ahk_id %windowHandleId%"
    }
  }
  ; Else it's not already open, so launch it.
  else {
    Switch programName {
      case "WindowsTerminal.exe":
        Run, explorer.exe shell:AppsFolder\Microsoft.WindowsTerminal_8wekyb3d8bbwe!App
        return
      case "KeePassXC.exe":
        Run, "C:\Program Files\KeePassXC\KeePassXC.exe"
        return
      default:
        Run, %programName%
    }
  }
}

ToggleChat() {
  chatPrograms := ["slack.exe", "Signal.exe"]

  windowOpen := false

  ; Check if any are open
  For index, programName in chatPrograms {
    WinGet, windowHandleId, ID, ahk_exe %programName%
    if (windowHandleId > 0) {
      windowOpen := true
    }
  }

  ; If any of them are open then attempt to close all
  if (windowOpen = true) {
    For index, programName in chatPrograms {
      WinGet, windowPID, PID, ahk_exe %programName%
      if (windowPID > 0) {
        Process, Close, %windowPID%
      }
    }
  }
  ; None are open so open them all
  else {
    Run, "C:\Users\news\AppData\Local\slack\slack.exe"
    Run, "C:\Users\news\AppData\Local\Programs\signal-desktop\Signal.exe"
  }
}

; Shortcuts
<^>!c::ToggleChat() ; altgr + c
<^>!f::SwitchTo("firefox.exe") ; altgr + f
<^>!k::SwitchTo("KeePassXC.exe") ; altgr + k
<^>!t::SwitchTo("WindowsTerminal.exe") ; altgr + t
<^>!s::DllCall("PowrProf\SetSuspendState", "Int", 0, "Int", 0, "Int", 0) ; altgr + s
<^>!r::FileRecycleEmpty ; altgr + r
<^>!SPACE:: Winset, Alwaysontop, , A ; altgr + space
return

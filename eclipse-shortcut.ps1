$SourceFileLocation = "C:\Program Files (x86)\Eclipse\eclipse\eclipse.exe"

$ShortcutLocation = "C:\Users\$env:USERNAME\Desktop\Eclipse JAVA - IDE.lnk"

$WScriptShell = New-Object -ComObject WScript.Shell

$Shortcut = $WScriptShell.CreateShortcut($ShortcutLocation)

$Shortcut.TargetPath = $SourceFileLocation

$Shortcut.Save()

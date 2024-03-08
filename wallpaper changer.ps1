# Setze den Bildlink
$BildLink = "https://raw.githubusercontent.com/DukeDaxen/images/main/Screenshot%202024-03-08%20200246.png"

# Setze den Speicherort für das temporäre Bild
$TempBild = "$env:TEMP\hintergrundbild.jpg"

# Lade das Bild von der URL herunter
Invoke-WebRequest -Uri $BildLink -OutFile $TempBild

# Setze das Hintergrundbild
SystemParametersInfo(20, 0, $TempBild, 0x01)

# Funktion zum Setzen des Hintergrundbildes
function SystemParametersInfo($uiAction, $uiParam, $pvParam, $fWinIni) {
    Add-Type @"
        using System;
        using System.Runtime.InteropServices;
        public class Wallpaper {
            [DllImport("user32.dll", CharSet = CharSet.Auto)]
            public static extern int SystemParametersInfo (int uAction, int uParam, string lpvParam, int fuWinIni);
        }
"@
    [Wallpaper]::SystemParametersInfo($uiAction, $uiParam, $pvParam, $fWinIni)
}

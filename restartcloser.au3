#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_icon=icon.ico
#AutoIt3Wrapper_Res_Comment=This tool waits for the reboot windows to appear and closes it automatically
#AutoIt3Wrapper_Res_Description=Avira reboot question window closer
#AutoIt3Wrapper_Res_Fileversion=1.0.0.1
#AutoIt3Wrapper_Res_LegalCopyright=Torsten Feld - 2011
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

#Include <Constants.au3>

Opt("TrayMenuMode", 1)

Global $TrayStartStop = TrayCreateItem("Stop asking")
Global $TrayAbout = TrayCreateItem("About", -1, -1, 1)
Global $TrayExit = TrayCreateItem("Exit", -1, -1, 1)
;~ Global $TrayStatus = TrayCreateItem("Status")

TraySetState()

TrayItemSetState($TrayStartStop, 65)

While 1
	$msg = TrayGetMsg()
	Select
		Case $msg = 0
			If TrayItemGetState($TrayStartStop) = 65 Then
				If WinExists("Systemneustart", "Das durchgeführte Update erfordert einen Systemneustart. Soll der Systemneustart jetzt ausgeführt werden?") Then
					WinKill("Systemneustart", "Das durchgeführte Update erfordert einen Systemneustart. Soll der Systemneustart jetzt ausgeführt werden?")
				EndIf
			EndIf
			Sleep(500)
			ContinueLoop
;~ 		Case $msg = $TrayStartStop
;~ 			If TrayItemGetState($TrayStartStop) = 65 Then
;~ 				$gCheckOn = False
;~ 			ElseIf TrayItemGetState($TrayStartStop) = 68 Then
;~ 				$gCheckOn = True
;~ 			Else
;~ 				ContinueLoop
;~ 			EndIf
		Case $msg = $TrayAbout
			Msgbox(64, "About:", "This is a little tool to close the Avira Update message after it asks for a reboot.")
		Case $msg = $TrayExit
			ExitLoop
;~ 		Case $msg = $TrayStatus
;~ 			MsgBox(0, "state", TrayItemGetState($TrayStartStop))
	EndSelect
WEnd

Exit

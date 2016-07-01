FileInstall, C:\Users\Administrator\Desktop\Binder\MainMenu.jpg, %A_WorkingDir%\My Application\MainMenu.jpg
FileInstall, C:\Users\Administrator\Desktop\Binder\CreateProfileMenu.jpg, %A_WorkingDir%\My Application\CreateProfileMenu.jpg

MainMenu:
Gui, Add, Picture, x0 y0 h400 w360, %A_ScriptDir%\MainMenu.jpg

;=================Êîðîáî÷êà
Gui, Add, GroupBox, x58 y35 h300 w246


Gui, Font, S8 C4169E1, Obelix Pro
Gui, Add, Text, x125 y25 +BackGroundTrans, Ãëàâíîå ìåíþ

Gui, Font, S7 C4169E1, Obelix Pro
Gui, Add, Text, x75 y53 +BackGroundTrans, Óïðàâëåíèå áèíäåðîì:

Gui, Font, S7 C00FFFF, Obelix Pro
Gui, Add, Button, x64 y65 h25 w100 +BackGroundTrans gMainMenuStart, Çàïóñòèòü

Gui, Font, S8 CBlack
Gui, Add, Text, x64 y82 +BackGroundTrans, .
Gui, Add, Text, x64 y92 +BackGroundTrans, .
Gui, Add, Text, x64 y102 +BackGroundTrans, .
Gui, Add, Text, x64 y112 +BackGroundTrans, .
Gui, Add, Text, x64 y117 +BackGroundTrans, .

Gui, Font, S8 CBlack
Gui, Add, Text, x160 y82 +BackGroundTrans, .
Gui, Add, Text, x160 y92 +BackGroundTrans, .
Gui, Add, Text, x160 y102 +BackGroundTrans, .
Gui, Add, Text, x160 y112 +BackGroundTrans, .
Gui, Add, Text, x160 y117 +BackGroundTrans, .

Gui, Font, S5 CE32636, Obelix Pro
Gui, Add, Button, x-1 y386 h15 w125 +BackGroundTrans gMainMenuErrorSpeak, Ñîîáùèòü îá îøèáêå
Gui, Add, Button, x156 y388 h12 w85 +BackGroundTrans gDeleteInformation, Ñáðîñèòü âñå

Gui, Font, S7 C00FFFF, Obelix Pro
Gui, Add, Button, x64 y125 h25 w100 +BackGroundTrans gMainMenuDelete, Óäàëèòü


Gui, Font, S7 C00FFFF, Obelix Pro
Gui, Add, Button, x184 y300 h25 w100 +BackGroundTrans gMainMenuCreators, Ñîçäàòåëè

Gui, Font, S7 C00FFFF, Obelix Pro
Gui, Add, Button, x64 y300 h25 w100 +BackGroundTrans gMainMenuUpdate, Îáíîâèòü

Gui, Font, S7 C00FFFF, Obelix Pro
Gui, Add, Text, x115 y340 +BackGroundTrans, Óïðàâëåíèå ïðîôèëåì

Gui, Font, S6 Cblack, Obelix Pro
Gui, Add, Button, x65 y355 h25 w100 +BackGroundTrans gMainMenuCreate, Ñîçäàòü
Gui, Add, Button, x190 y355 h25 w100 +BackGroundTrans gMainMenuLoad, Çàãðóçèòü

;===================================Version========================================================================
Gui, Font, S6 C00FFFF, Obelix Pro
Gui, Add, Text, x315 y390 +BackGroundTrans, Ver.[2.7]
;==================================================================================================================
Gui, Show, x508 y234 h400 w360, GTA:SA:MP Script By MandarinKa

Goto, LoadSettingsFile
Return

LoadSettingsFile:
IniRead, FileOpen, %A_ScriptDir%\BinderByMandarinKa.ini, Settings, CountNickNames
if FileOpen=ERROR
{
	CountNickNames=0
	IniWrite, 	%CountNickNames%,			%A_WorkingDir%\BinderByMandarinKa.ini, Settings,	CountNickNames
}
else
{
	IniRead, 	CountNickNames, 			%A_WorkingDir%\BinderByMandarinKa.ini, 			Settings, 	CountNickNames
	IniRead, 	NickNameOutputVar, 			%A_WorkingDir%\BinderByMandarinKa.ini, 			Settings, 	NickName

	IniRead, 	NickNameOutputVar, 			%A_WorkingDir%\BinderByMandarinKa.ini, 			Settings, 	NickName
	IniRead, 	SexChoiceOutputVar, 		%A_WorkingDir%\%NickNameOutputVar%.profile, 	Settings, 	Sex
	IniRead, 	OrgChoiceOutputVar, 		%A_WorkingDir%\%NickNameOutputVar%.profile,		Settings, 	Organization
	IniRead, 	ServerChoiceOutputVar, 		%A_WorkingDir%\%NickNameOutputVar%.profile, 	Settings, 	Server
	IniRead, 	LvlOutputVar, 				%A_WorkingDir%\%NickNameOutputVar%.profile, 	Settings, 	Lvl
	MsgBox, NickName - %NickNameOutputVar% Sex - %SexChoiceOutputVar% Organization %OrgChoiceOutputVar% Server %ServerChoiceOutputVar% Lvl- %LvlOutputVar%
	if CountNickNames=1
	{
	}
}
Return

MainMenuStart:

Return

MainMenuErrorSpeak:
MsgBox, Íàïèøèòå ìíå â ñêàéï: vetos45.ru
Return

DeleteInformation:
FileDelete, %A_WorkingDir%\*.ini
FileDelete, %A_WorkingDir%\*.profile
SetTimer, DeleteInformation2, 3000
MsgBox, 48, Ðåñòàðò ,Ñåé÷àñ ïðîèçîéäåò ðåñòàðò.
Return

DeleteInformation2:
Reload
Return

MainMenuDelete:
MsgBox, Ñàìîóíè÷òîæåíèå íå äîñòóïíî.
Return

MainMenuCreators:
MsgBox, Ãë. Ñîçäàòåëü Antonio_Stivenson. Ñïèñîê áóäåò äîïîëíÿòüñÿ.
Return

MainMenuUpdate:
MsgBox, Ñèñòåìà àâòîîáíîâëåíèÿ â òåñòèðîâàíèè è ïîêà ÷òî íå äîñòóïíà.
Return

MainMenuCreate:
Gui, Destroy
Goto, CreateProfileMenu
Return

MainMenuLoad:
if CountNickNames=0
{
	MsgBox, Ó âàñ íåò ïðîôèëåé. Òàê ÷åãî æå æäàòü? Ñîçäàéòå åãî!
	Return
}
else
{
	MainMenuLoadCount++
	if MainMenuLoadCount=1
	{
		NickName=%NickNameOutputVar%
		MsgBox, Ïðîôèëü %NickNameOutputVar%. Óñïåøíî çàãðóæåí
	}
	else
	{
		MsgBox, Ïðîôèëü %NickNameOutputVar%. Óæå áûë çàãðóæåí.
	}
}
Return





;=========================CreateProfileMenu
CreateProfileMenu:
Gui, Add, Picture, x-70 y0 h380 w480, %A_ScriptDir%\CreateProfileMenu.jpg

Gui, Font, S8 CFFFAF0, Obelix Pro
Gui, Add, Text, x110 y25 +BackGroundTrans, Çàäàéòå ïàðàìåòðû:

;=================Êîðîáî÷êà
Gui, Add, GroupBox, x58 y35 h300 w246



Gui, Font, S6 CFFFAF0, COPPERPLATE
Gui, Add, Text, x68 y50 +BackGroundTrans, Âûáåðèòå âàø ïðîôèëü:
Gui, Add, Text, x68 y90 +BackGroundTrans, Âûáåðèòå âàø ïîë:
Gui, Add, Text, x68 y130 +BackGroundTrans, Âûáåðèòå âàøó îðãàíèçàöèþ(ëåãàëüíûå):
Gui, Add, Text, x68 y170 +BackGroundTrans, Âûáåðèòå âàø ñåðâåð:
Gui, Add, Text, x68 y210 +BackGroundTrans, Ñêîëüêî ëåò âû â øòàòå:

SexChoice =Ìóæñêîé
OrgChoice =Ãðàæäàíêà
ServerChoice =Red

if CountNickNames =0
{
	NickNameList =Íîâûé ïðîôèëü
	Gui, Font, S6 Cblue, Obelix Pro
	Gui, Add, DropDownList, x68 y65 w155 vNickNameList +BackGroundTrans, Íîâûé ïðîôèëü||
	Gui, Font, S6 CFFFAF0, COPPERPLATE
	Gui, Add, Text, x175 y7 +BackGroundTrans, NickName:
	Gui, Font, S6 Cblack, Obelix Pro
	Gui, Add, Edit, x230 y5 h20 w130 Limit30 vNickNameWrite,
	Gui, Add, Button, x130 y345 h25 w100 gCreateProfileMenuSave, Ñîõðàíèòü
}
if CountNickNames =1
{
	Gui, Font, S6 Cblue, Obelix Pro
	Gui, Add, DropDownList, x68 y65 w155 vNickNameList +BackGroundTrans, %NickNameOutputVar%||
	Gui, Add, Button, x130 y345 h25 w100 gCreateProfileMenuSave, Èçìåíèòü
}

Gui, Font, S6, Obelix Pro

Gui, Add, DropDownList, x68 y105 w155 vSexChoice +BackGroundTrans, Ìóæñêîé||Æåíñêèé
Gui, Add, DropDownList, x68 y145 w155 vOrgChoice +BackGroundTrans, Ãðàæäàíêà||Ìèíèñòåðòñâî Îáîðîíû|Ìèíèñòåðòñâî Âíóòðåíèõ Äåë|Ìèíèñòåðòñâî Çäðàâîîõðàíåíèÿ|Ïðàâèòåëüñòâî
Gui, Add, DropDownList, x68 y185 w155 vServerChoice +BackGroundTrans, Red||Green|Yellow|Orange|Blue|White|Silver|Purple|Chocolate
Gui, Add, Edit, x195 y206 w20 Limit3 vLvl
;===================================Version========================================================================
Gui, Font, S6 CFFFAF0, COPPERPLATE
Gui, Add, Text, x315 y365 +BackGroundTrans, Ver.[2.7]
;==================================================================================================================
Gui, Font, S6 Cblack, Obelix Pro

Gui, Show, x508 y234 h380 w360, GTA:SA:MP Script By MandarinKa
Return



CreateProfileMenuSave:
GuiControlGet, NickNameList
GuiControlGet, SexChoice
GuiControlGet, OrgChoice
GuiControlGet, ServerChoice
GuiControlGet, Lvl
if NickNameList =
{
	MsgBox, Âû âûáðàëè NickName?
	Return
}
if NickNameList =Íîâûé ïðîôèëü
{
	GuiControlGet, NickNameWrite
	if NickNameWrite =
	{
		MsgBox, Âû ââåëè íîâûé NickName?
		Return
	}
}
if SexChoice =
{
	MsgBox, Âû ìóæ÷èíà èëè æåíùèíà?
	Return
}
if OrgChoice =
{
	MsgBox, Â êàêîé âû îðãàíèçàöèè?
	Return
}
if ServerChoice =
{
	MsgBox, Íà êàêîì ñåðâåðå âû èãðàåòå?
	Return
}
if Lvl =
{
	MsgBox, Ñêîëüêî ëåò âû â øòàòå?
	Return
}

;============Ïîñëå òðóäíîé ïðîâåðêè ïèøåì âñ¸ â Settings
if NickNameList =Íîâûé ïðîôèëü
{
	CountNickNames = %CountNickNames%
	CountNickNames++
	IniWrite, 	%CountNickNames%, 	%A_WorkingDir%\BinderByMandarinKa.ini, 		Settings, CountNickNames
	IniWrite, 	%NickNameWrite%, 	%A_WorkingDir%\BinderByMandarinKa.ini, 		Settings, NickName
	IniWrite, 	%SexChoice%, 		%A_WorkingDir%\%NickNameWrite%.profile, 	Settings, Sex
	IniWrite, 	%OrgChoice%, 		%A_WorkingDir%\%NickNameWrite%.profile, 	Settings, Organization
	IniWrite, 	%ServerChoice%, 	%A_WorkingDir%\%NickNameWrite%.profile,		Settings, Server
	IniWrite, 	%Lvl%, 				%A_WorkingDir%\%NickNameWrite%.profile, 	Settings, Lvl
}
else
{
	IniWrite, 	%NickNameList%, 	%A_WorkingDir%\BinderByMandarinKa.ini, 		Settings, NickName
	IniWrite, 	%SexChoice%, 		%A_WorkingDir%\%NickNameList%.profile, 		Settings, Sex
	IniWrite, 	%OrgChoice%, 		%A_WorkingDir%\%NickNameList%.profile, 		Settings, Organization
	IniWrite, 	%ServerChoice%, 	%A_WorkingDir%\%NickNameList%.profile,		Settings, Server
	IniWrite, 	%Lvl%, 				%A_WorkingDir%\%NickNameList%.profile, 		Settings, Lvl
}
Reload
Return













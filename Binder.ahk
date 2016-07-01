FileInstall, C:\Users\Administrator\Desktop\Binder\MainMenu.jpg, %A_WorkingDir%\My Application\MainMenu.jpg
FileInstall, C:\Users\Administrator\Desktop\Binder\CreateProfileMenu.jpg, %A_WorkingDir%\My Application\CreateProfileMenu.jpg

MainMenu:
Gui, Add, Picture, x0 y0 h400 w360, %A_ScriptDir%\MainMenu.jpg

;=================Коробочка
Gui, Add, GroupBox, x58 y35 h300 w246


Gui, Font, S8 C4169E1, Obelix Pro
Gui, Add, Text, x125 y25 +BackGroundTrans, Главное меню

Gui, Font, S7 C4169E1, Obelix Pro
Gui, Add, Text, x75 y53 +BackGroundTrans, Управление биндером:

Gui, Font, S7 C00FFFF, Obelix Pro
Gui, Add, Button, x64 y65 h25 w100 +BackGroundTrans gMainMenuStart, Запустить

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
Gui, Add, Button, x-1 y386 h15 w125 +BackGroundTrans gMainMenuErrorSpeak, Сообщить об ошибке
Gui, Add, Button, x156 y388 h12 w85 +BackGroundTrans gDeleteInformation, Сбросить все

Gui, Font, S7 C00FFFF, Obelix Pro
Gui, Add, Button, x64 y125 h25 w100 +BackGroundTrans gMainMenuDelete, Удалить


Gui, Font, S7 C00FFFF, Obelix Pro
Gui, Add, Button, x184 y300 h25 w100 +BackGroundTrans gMainMenuCreators, Создатели

Gui, Font, S7 C00FFFF, Obelix Pro
Gui, Add, Button, x64 y300 h25 w100 +BackGroundTrans gMainMenuUpdate, Обновить

Gui, Font, S7 C00FFFF, Obelix Pro
Gui, Add, Text, x115 y340 +BackGroundTrans, Управление профилем

Gui, Font, S6 Cblack, Obelix Pro
Gui, Add, Button, x65 y355 h25 w100 +BackGroundTrans gMainMenuCreate, Создать
Gui, Add, Button, x190 y355 h25 w100 +BackGroundTrans gMainMenuLoad, Загрузить

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
MsgBox, Напишите мне в скайп: vetos45.ru
Return

DeleteInformation:
FileDelete, %A_WorkingDir%\*.ini
FileDelete, %A_WorkingDir%\*.profile
SetTimer, DeleteInformation2, 3000
MsgBox, 48, Рестарт ,Сейчас произойдет рестарт.
Return

DeleteInformation2:
Reload
Return

MainMenuDelete:
MsgBox, Самоуничтожение не доступно.
Return

MainMenuCreators:
MsgBox, Гл. Создатель Antonio_Stivenson. Список будет дополняться.
Return

MainMenuUpdate:
MsgBox, Система автообновления в тестировании и пока что не доступна.
Return

MainMenuCreate:
Gui, Destroy
Goto, CreateProfileMenu
Return

MainMenuLoad:
if CountNickNames=0
{
	MsgBox, У вас нет профилей. Так чего же ждать? Создайте его!
	Return
}
else
{
	MainMenuLoadCount++
	if MainMenuLoadCount=1
	{
		NickName=%NickNameOutputVar%
		MsgBox, Профиль %NickNameOutputVar%. Успешно загружен
	}
	else
	{
		MsgBox, Профиль %NickNameOutputVar%. Уже был загружен.
	}
}
Return





;=========================CreateProfileMenu
CreateProfileMenu:
Gui, Add, Picture, x-70 y0 h380 w480, %A_ScriptDir%\CreateProfileMenu.jpg

Gui, Font, S8 CFFFAF0, Obelix Pro
Gui, Add, Text, x110 y25 +BackGroundTrans, Задайте параметры:

;=================Коробочка
Gui, Add, GroupBox, x58 y35 h300 w246



Gui, Font, S6 CFFFAF0, COPPERPLATE
Gui, Add, Text, x68 y50 +BackGroundTrans, Выберите ваш профиль:
Gui, Add, Text, x68 y90 +BackGroundTrans, Выберите ваш пол:
Gui, Add, Text, x68 y130 +BackGroundTrans, Выберите вашу организацию(легальные):
Gui, Add, Text, x68 y170 +BackGroundTrans, Выберите ваш сервер:
Gui, Add, Text, x68 y210 +BackGroundTrans, Сколько лет вы в штате:

SexChoice =Мужской
OrgChoice =Гражданка
ServerChoice =Red

if CountNickNames =0
{
	NickNameList =Новый профиль
	Gui, Font, S6 Cblue, Obelix Pro
	Gui, Add, DropDownList, x68 y65 w155 vNickNameList +BackGroundTrans, Новый профиль||
	Gui, Font, S6 CFFFAF0, COPPERPLATE
	Gui, Add, Text, x175 y7 +BackGroundTrans, NickName:
	Gui, Font, S6 Cblack, Obelix Pro
	Gui, Add, Edit, x230 y5 h20 w130 Limit30 vNickNameWrite,
	Gui, Add, Button, x130 y345 h25 w100 gCreateProfileMenuSave, Сохранить
}
if CountNickNames =1
{
	Gui, Font, S6 Cblue, Obelix Pro
	Gui, Add, DropDownList, x68 y65 w155 vNickNameList +BackGroundTrans, %NickNameOutputVar%||
	Gui, Add, Button, x130 y345 h25 w100 gCreateProfileMenuSave, Изменить
}

Gui, Font, S6, Obelix Pro

Gui, Add, DropDownList, x68 y105 w155 vSexChoice +BackGroundTrans, Мужской||Женский
Gui, Add, DropDownList, x68 y145 w155 vOrgChoice +BackGroundTrans, Гражданка||Министертсво Обороны|Министертсво Внутрених Дел|Министертсво Здравоохранения|Правительство
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
	MsgBox, Вы выбрали NickName?
	Return
}
if NickNameList =Новый профиль
{
	GuiControlGet, NickNameWrite
	if NickNameWrite =
	{
		MsgBox, Вы ввели новый NickName?
		Return
	}
}
if SexChoice =
{
	MsgBox, Вы мужчина или женщина?
	Return
}
if OrgChoice =
{
	MsgBox, В какой вы организации?
	Return
}
if ServerChoice =
{
	MsgBox, На каком сервере вы играете?
	Return
}
if Lvl =
{
	MsgBox, Сколько лет вы в штате?
	Return
}

;============После трудной проверки пишем всё в Settings
if NickNameList =Новый профиль
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













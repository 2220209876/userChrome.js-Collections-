::NLF��������.
@echo off
title ����XXΪĬ�������

::�Զ��Թ���Ա�������bat�ļ�
cd /d %~dp0
%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit

::�Ƿ���������ļ�::
:: 1:���������ļ� 0�������������ļ�.
set "assLF=1"
::�Ƿ���������ļ�::

rem ���CingFox.exe
cd /d "%~dp0"
:loop_find
if /i "%cd%"=="%current%" exit
set "current=%cd%"
if not exist "%cd%\CingFox.exe" cd.. & goto loop_find
set "p=%cd%"
if exist "%p%recycler" set p=%p:\=%
set l=0
:loop
set /a l+=1
mode con cols=25  lines=%l%
if /i %l% lss 3 goto loop
rem Firefox�����ļ��е�·��
set "pf=%p%"
::echo %pf%
::pause
rem CingFox.exe������·��
set "p=%p%\CingFox.exe"
echo.   ......���Ժ�......

rem ��ʼ��������CingFox.exe�ɵ���opera
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\CingFox.exe" /ve /t reg_sz /d """"%p%"""" /f            >nul 2>nul
if  %errorlevel% neq 0 (echo.1.û��д��Ȩ��&echo.2.���Ҽ��Թ���Ա������а�װ����) | msg %username% /time:5 &exit
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\CingFox.exe" /v path /t reg_sz /d """"%pf%"""" /f       >nul

rem ���óɿ�ʼ�˵�Ĭ�������:
reg add "HKCU\software\clients\StartMenuInternet"                    /ve            /t reg_sz           /d CingFox.exe       /f   >nul

set "hsc=HKCU\software\classes\"
rem ����HttpЭ��
reg add "%hsc%http\DefaultIcon"                    /ve             /t REG_sz           /d """"%p%"""",0         /f  >nul 
reg add "%hsc%http\shell\open\Command"             /ve             /t REG_sz           /d """"%p%""""     /f  >nul 
rem ����HttpsЭ��
reg add "%hsc%https\DefaultIcon"                   /ve             /t REG_sz           /d """"%p%"""",0         /f >nul 
reg add "%hsc%https\shell\open\Command"            /ve             /t REG_sz           /d """"%p%""""     /f >nul 

rem ����FTPЭ��
reg add "%hsc%ftp\DefaultIcon"                     /ve             /t REG_sz           /d """"%p%"""",0         /f >nul 
reg add "%hsc%ftp\shell\open\Command"              /ve             /t REG_sz           /d """"%p%""""     /f >nul 


rem �����ļ�HTML�ļ�����
reg add "%hsc%FirefoxHTML"                              /ve                      /t reg_sz      /d "Firefox Web Document"      /f >nul 
reg add "%hsc%FirefoxHTML"                              /v  FriendlyTypeName     /t reg_sz      /d "Firefox Web Document"      /f >nul
reg add "%hsc%FirefoxHTML\DefaultIcon"                  /ve                      /t reg_sz      /d """"%p%"""",0             /f >nul
reg add "%hsc%FirefoxHTML\shell\open\command"           /ve                      /t reg_sz      /d """"%p%""" """%%1""""     /f >nul


rem �ļ���ָ��Firefox
if %assLF% equ 0 goto notass
reg add "%hsc%.xht"                                                /ve              /t REG_sz           /d FirefoxHTML      /f  >nul 
reg add "%hsc%.xhtm"                                               /ve              /t REG_sz           /d FirefoxHTML      /f  >nul 
reg add "%hsc%.xhtml"                                              /ve              /t REG_sz           /d FirefoxHTML      /f  >nul 
reg add "%hsc%.mht"                                                /ve              /t REG_sz           /d FirefoxHTML      /f  >nul 
reg add "%hsc%.mhtml"                                              /ve              /t REG_sz           /d FirefoxHTML      /f  >nul 
reg add "%hsc%.htm"                                                /ve              /t reg_sz           /d FirefoxHTML      /f  >nul
reg add "%hsc%.html"                                               /ve              /t reg_sz           /d FirefoxHTML      /f  >nul

:notass
rem xpע��������
if exist "%systemdrive%\ntldr" goto final

:v7
rem  vista�������û�ѡ��ע�����
rem ����д��Ȩ��
set "qx=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\"
> "%~dp0temp.ini" cd.
>> "%~dp0temp.ini" (
 echo %qx%.htm\userchoice [1 17]
 echo %qx%.html\userchoice [1 17]
 echo %qx%.xht\userchoice [1 17]
 echo %qx%.xhtm\userchoice [1 17]
 echo %qx%.xhtml\userchoice [1 17]
 echo %qx%.mht\userchoice [1 17]
 echo %qx%.mhtml\userchoice [1 17]
 echo %qx%.xml\userchoice [1 17]
)

if exist "%~dp0temp.ini" regini "%~dp0temp.ini" && del /q /a "%~dp0temp.ini"
::pause

rem Э���
reg add "%hsc%Firefox.Protocol"                              /ve                  /t reg_sz      /d "Firefox Protocol"          /f >nul
reg add "%hsc%Firefox.Protocol"                              /v  FriendlyTypeName /t reg_sz      /d "Firefox Protocol"          /f >nul
reg add "%hsc%Firefox.Protocol"                              /v EditFlags         /t reg_dword   /d 2                         /f >nul
reg add "%hsc%Firefox.Protocol\DefaultIcon"                  /ve                  /t reg_sz      /d """"%p%"""",0             /f >nul
reg add "%hsc%Firefox.Protocol\shell\open\command"           /ve                  /t reg_sz      /d """"%p%""" """%%1""""     /f >nul

rem ��Firefoxע���Ĭ�ϳ�������еĳ���
reg add "HKLM\software\RegisteredApplications"                            /v "Firefox Browser" /t reg_sz      /d "Software\Clients\StartMenuInternet\CingFox.exe\Capabilities"  /f  >nul

set "d_opera=HKLM\SOftware\Clients\StartMenuInternet\CingFox.exe\Capabilities"
rem Firefox��Ĭ�ϳ�������е�����:"The Best Internet Experience on any device"
reg add "%d_opera%" /v ApplicationIcon           /t reg_sz      /d """"%p%"""",0                                    /f  >nul
reg add "%d_opera%" /v ApplicationDescription    /t reg_sz      /d "���ٶ��Ұ�ȫ�������"     /f  >nul
reg add "%d_opera%" /v ApplicationName           /t reg_sz      /d "Firefox Browser"                              /f  >nul

rem Ĭ�ϳ�������е�:��չ��
reg add "%d_opera%\FileAssociations" /v .htm     /t reg_sz      /d FirefoxHTML   /f  >nul
reg add "%d_opera%\FileAssociations" /v .html    /t reg_sz      /d FirefoxHTML   /f  >nul
reg add "%d_opera%\FileAssociations" /v .xml     /t reg_sz      /d FirefoxHTML   /f  >nul
reg add "%d_opera%\FileAssociations" /v .xhtm    /t reg_sz      /d FirefoxHTML   /f  >nul
reg add "%d_opera%\FileAssociations" /v .xht     /t reg_sz      /d FirefoxHTML   /f  >nul
reg add "%d_opera%\FileAssociations" /v .xhtml   /t reg_sz      /d FirefoxHTML   /f  >nul
reg add "%d_opera%\FileAssociations" /v .mhtml   /t reg_sz      /d FirefoxHTML   /f  >nul
reg add "%d_opera%\FileAssociations" /v .mht     /t reg_sz      /d FirefoxHTML   /f  >nul

rem Ĭ�ϳ�������е�:Э��
reg add "%d_opera%\UrlAssociations" /v ftp      /t reg_sz     /d Firefox.Protocol /f  >nul
reg add "%d_opera%\UrlAssociations" /v http     /t reg_sz     /d Firefox.Protocol /f  >nul
reg add "%d_opera%\UrlAssociations" /v https    /t reg_sz     /d Firefox.Protocol /f  >nul
reg add "%d_opera%\UrlAssociations" /v maito    /t reg_sz     /d Firefox.Protocol /f  >nul
reg add "%d_opera%\UrlAssociations" /v news     /t reg_sz     /d Firefox.Protocol /f  >nul
reg add "%d_opera%\UrlAssociations" /v gopher   /t reg_sz     /d Firefox.Protocol /f  >nul
reg add "%d_opera%\UrlAssociations" /v ftp      /t reg_sz     /d Firefox.Protocol /f  >nul



rem [��ʼ]�˵�Firefox
reg add "HKLM\SOftware\clients\StartMenuInternet\CingFox.exe"                             /ve          /t reg_sz     /d Firefox         /f  >nul
reg add "HKLM\SOftware\Clients\StartMenuInternet\CingFox.exe\DefaultIcon"                 /ve          /t reg_sz     /d """"%p%"""",0  /f  >nul
reg add "HKLM\SOftware\Clients\StartMenuInternet\CingFox.exe\shell\open\command"          /ve          /t reg_sz     /d """"%p%""""    /f  >nul





if %assLF% equ 0 goto notass2
set "gl=HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\"
rem ���ļ��Ĵ򿪷�ʽָ��Firefox
reg add "%gl%.htm\userchoice"    /v  progid  /t reg_sz   /d FirefoxHTML   /f >nul
reg add "%gl%.html\userchoice"   /v  progid  /t reg_sz   /d FirefoxHTML   /f >nul
reg add "%gl%.xht\userchoice"    /v  progid  /t reg_sz   /d FirefoxHTML   /f >nul
reg add "%gl%.xhtm\userchoice"   /v  progid  /t reg_sz   /d FirefoxHTML   /f >nul
reg add "%gl%.xhtml\userchoice"  /v  progid  /t reg_sz   /d FirefoxHTML   /f >nul
reg add "%gl%.mht\userchoice"    /v  progid  /t reg_sz   /d FirefoxHTML   /f >nul
reg add "%gl%.mhtml\userchoice"  /v  progid  /t reg_sz   /d FirefoxHTML   /f >nul
reg add "%gl%.xml\userchoice"    /v  progid  /t reg_sz   /d FirefoxHTML   /f >nul
:notass2

set "glp=HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\"
rem ��Э��Ĵ򿪷�ʽָ��Firefox
reg add "%glp%http\UserChoice"  /v  progid  /t reg_sz   /d Firefox.Protocol   /f >nul
reg add "%glp%https\UserChoice" /v  progid  /t reg_sz   /d Firefox.Protocol   /f >nul
reg add "%glp%ftp\UserChoice"   /v  progid  /t reg_sz   /d Firefox.Protocol   /f >nul

rem �ָ� vista win7��ͼ����ʾ..
reg delete "HKLM\software\classes\FirefoxHTML\ShellEx"            /f >nul 2>nul

:final
exit

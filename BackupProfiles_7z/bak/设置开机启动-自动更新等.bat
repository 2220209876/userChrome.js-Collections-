@echo off
pushd "%~dp0"
set appPath=%~dp0

:Select
cls

:SelectC
echo  �����win7��8�����ڱ����������Ҽ�ѡ�����Ա���С�
echo.
echo   x��һ�����������1��4��7��0��������ţ
echo   d��һ��ȡ������
echo.
echo   1�����ÿ�������
echo   2��ȡ����������
echo.
echo   3������Ĭ������(�Ḳ���Զ�������)
echo   4��ÿ���Զ�����Ĭ������
echo   5��ȡ���Զ�����Ĭ������
echo.
echo   6��ÿһСʱ�Զ�����CJX����
echo   7��ÿ��Сʱ�Զ�����CJX����
echo   8��ÿ��Сʱ�Զ�����CJX����
echo   p�����ô����Զ�����CJX����
echo   9��ȡ���Զ�����CJX����
echo.
echo   0������LSP���޸�ԭ��Ѹ�׵��±���������
echo.
echo   m���������⣬ѡ�����鿴CJX����˵��
echo.

set /p id=��ѡ�񣬰��س���ִ��:
cls
if "%id%"=="0" goto O
if "%id%"=="1" goto B
if "%id%"=="2" goto C
if "%id%"=="3" goto A
if "%id%"=="4" goto A2
if "%id%"=="5" goto A3
if "%id%"=="6" goto D
if "%id%"=="7" goto E
if "%id%"=="8" goto F
if "%id%"=="p" goto F1
if "%id%"=="9" goto G
if "%id%"=="10" goto I
if "%id%"=="11" goto K0
if "%id%"=="m" goto L
if "%id%"=="x" goto N
if "%id%"=="d" goto P
goto SelectC

:O
netsh winsock reset catalog >nul
echo.
echo  ������LSP�����ʹ������Ȼ�������������������������������ԡ�
echo.
echo  ÿ�θ���Ѹ�׺󣬶�Ҫ����LSP��
echo.
echo  �밴������������˵���
pause>nul
goto Select

:B
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "Ad muncher" /t REG_SZ /d "\"%~dp0AdMunch.exe\" /bt" /f
echo.
echo  �����ÿ����������밴������������˵���
pause>nul
goto Select

:C
REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "Ad muncher" /f
echo.
echo  ��ȡ�������������밴������������˵���
pause>nul
goto Select

:A
wget -N http://cjx82630.opendrive.com/files/Ml82NjI4OTM2Nl9aRHQ1Sl8xZmU0/Update.amc
echo.
echo  �Ѹ��¹�������б�����ã��밴������������˵���
pause>nul
goto Select

:A2
start /B /wait sc config Schedule start= auto >nul
start /B /wait sc start Schedule >nul
schtasks /delete /tn AdMuncher3 /f
start /B /wait schtasks /create /sc weekly /mo 1 /ru "System" /tn "AdMuncher3" /tr """"%appPath%autoupdate1.bat"""
start /B /wait schtasks /run /tn "AdMuncher3"
echo.
echo  ������ÿ�ܸ��¹�������б����ã��밴������������˵���
pause>nul
goto Select

:A3
schtasks /delete /tn AdMuncher3 /f
echo.
echo  ��ȡ��ÿ�ܸ��¹�������б����ã��밴������������˵���
pause>nul
goto Select

:D
start /B /wait sc config Schedule start= auto >nul
start /B /wait sc start Schedule >nul
schtasks /delete /tn AdMuncher1 /f>nul
start /B /wait schtasks /create /sc minute /mo 60 /ru "System" /tn "AdMuncher1" /tr """"%appPath%autoupdate.bat"""
start /B /wait schtasks /run /tn "AdMuncher1"
echo.
echo  ������ÿһСʱ���£��밴������������˵���
pause>nul
goto Select

:E
start /B /wait sc config Schedule start= auto >nul
start /B /wait sc start Schedule >nul
schtasks /delete /tn AdMuncher1 /f
start /B /wait schtasks /create /sc minute /mo 120 /ru "System" /tn "AdMuncher1" /tr """"%appPath%autoupdate.bat"""
start /B /wait schtasks /run /tn "AdMuncher1"
echo.
echo  ������ÿ��Сʱ���£��밴������������˵���
pause>nul
goto Select

:F
start /B /wait sc config Schedule start= auto >nul
start /B /wait sc start Schedule >nul
schtasks /delete /tn AdMuncher1 /f
start /B /wait schtasks /create /sc minute /mo 240 /ru "System" /tn "AdMuncher1" /tr """"%appPath%autoupdate.bat"""
start /B /wait schtasks /run /tn "AdMuncher1"
echo.
echo  ������ÿ��Сʱ���£��밴������������˵���
pause>nul
goto Select

:F1
:IP
set /p IP=���������IP���˿ڣ���127.0.0.1:8087��:
if "%IP%"=="" goto IP
(echo %IP%) >ip.txt
:IP1
set /p IP1=������ÿ�����ٷ��Ӹ��£���120��:
if "%IP1%"=="" goto IP1
start /B /wait sc config Schedule start= auto >nul
start /B /wait sc start Schedule >nul
schtasks /delete /tn AdMuncher1 /f
start /B /wait schtasks /create /sc minute /mo %IP1% /ru "System" /tn "AdMuncher1" /tr """"%appPath%autoupdateP.bat"""
start /B /wait schtasks /run /tn "AdMuncher1"
echo.
echo  �밴������������˵���
pause>nul
goto Select

:G
schtasks /delete /tn AdMuncher1 /f
echo.
echo  ��ȡ���Զ����£��밴������������˵���
pause>nul
goto Select

:L
START IEXPLORE http://bbs.kafan.cn/thread-1133619-1-1.html
goto Select

:N
start /B /wait sc config Schedule start= auto >nul
start /B /wait sc start Schedule >nul
schtasks /delete /tn AdMuncher3 /f
schtasks /delete /tn AdMuncher1 /f
start /B /wait schtasks /create /sc weekly /mo 1 /ru "System" /tn "AdMuncher3" /tr """"%appPath%autoupdate1.bat"""
start /B /wait schtasks /run /tn "AdMuncher3"
start /B /wait schtasks /create /sc minute /mo 120 /ru "System" /tn "AdMuncher1" /tr """"%appPath%autoupdate.bat"""
start /B /wait schtasks /run /tn "AdMuncher1"
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "Ad muncher" /t REG_SZ /d "\"%~dp0AdMunch.exe\" /bt" /f
netsh winsock reset catalog >nul
echo.
echo  ������LSP�������Ч���������ԡ�
echo.
echo  ÿ�θ���Ѹ�׺󣬶�Ҫ����LSP��
echo.
echo  5����ؿ���ţ��
echo.
ping -n 5 127.1 >nul
taskkill /f /im AdMunch.exe >nul
start "" "%appPath%AdMunch.exe"
echo  ��������������˵���
pause>nul
goto Select


:P
REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "Ad muncher" /f
schtasks /delete /tn AdMuncher3 /f
schtasks /delete /tn AdMuncher1 /f
echo.
echo  �����ÿ�ܸ��¹�������б�����������ÿ��Сʱ���¹���
echo.
echo  ��������������˵���
pause>nul
goto Select
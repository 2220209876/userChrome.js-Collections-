@echo off
color 2E
echo.
echo    *** ����������Я��flash�����Я�������� ***
echo.
echo    ʹ�ñ��������FF�������Я��ԭ��֧��flash���Ӵ˿��Էŵ�U����ʹ���ˣ�
echo    ��������
echo ============================================================
echo    **ע�⣺
echo    1.����������Ҫ�Ȱ�װ��IE��Adobe Flash Player�����
echo    2.��Ѹ�������ŵ���firefox.exe�ļ���ͬ��Ŀ¼�����У�
echo    3.64λϵͳ������ȡ�����firefox�ƺ�ֻ����32λ����
echo    4.��������ûʲô������������Ȼû�в���������ʹ��~~
echo.
echo    Edit By yndoc��
echo.
echo    ���������������
echo =============================================================
pause>nul
cls
echo.
echo   1�����ٷ����ط�IE��Flash�����װ����ȡ��
echo.
echo   2���Ѿ���װ��IE��Flash�����ֱ����ȡ��
echo.
echo   e���˳���������
echo.
echo.

set /p id=��ѡ�񣬰��س���ִ��:
cls

if "%id%"=="1" goto install
if "%id%"=="2" goto set
if "%id%"=="e" goto exit

:install
echo.
echo    �����������ٷ������ַ����
echo.
pause>nul&start "" http://get.adobe.com/cn/flashplayer/otherversions/
cls
echo.
echo    *����ʱ��Ҫ�رո���������
echo.
echo    *������Ѱ�װ���Adobe Flash Player������밴�������������
pause>nul

:set
cls
if ��%PROCESSOR_ARCHITECTURE%��=="x86" (goto XX86) else (goto XX64)

:XX86
md plugins
copy/y C:\Windows\System32\Macromed\Flash\npswf32*.dll plugins\&copy/y C:\Windows\System32\Macromed\Flash\*plugin*.* plugins\||cls&echo ��ȡflash���ʧ�ܣ���ȷ�Ϲٷ�flash����Ƿ�װ�ɹ�����&&pause>nul
echo.
cls
echo ��ȡflash����̻��ɹ������ڰ������������������ж�عٷ�flash���������ַ�Ϊplugin�İ汾����װ������&pause>nul&&rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl 2

:XX64
echo.
echo  �ű���⵽��ʹ�õ���64λϵͳ��64λ�����32λfirefox�����ݣ�ȡ����ȡ��&echo  ����ֱ��ʹ�����ոհ�װ��flash�ٷ������װ����&echo. &echo  �Ƿ�ж���Ѱ�װ��IE���flash�������&echo  ���������ж�أ���ж��ֱ�ӹرձ�������Ctrl+C����&&pause>nul&rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl 2 


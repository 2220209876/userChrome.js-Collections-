::2016.06.08
@echo off

::最小化运行批处理
::From: http://www.jb51.net/article/7347.htm
::if "%1"=="h" goto begin
::start mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit
:begin

::設置程序文件夾位置
set dir=D:\Program Files

::公司用軟件
start "" "C:\Program Files (x86)\XiaoMi\MiWiFi\MiWiFi.exe"
start "" "%dir%\Jingoal\Jingoal.exe" & ping localhost -n 3
start "" "%dir%\Tencent\Foxmail\Foxmail.exe" /min
::start "" "%dir%\CingFox\Software\GFW\Shadowsocks\ShadowsocksR-dotnet4.0.exe"
start "" "%dir%\CingFox\Software\GFW\Shadowsocks\SSCap64\SSCap.exe"

::完成後退出
exit
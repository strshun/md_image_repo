if %1 == 0  set controldevice=gamepad
if %1 == 1  set controldevice=mouseandkey

cd  /d %~dp0

start /wait /min ..\haima_init_program\get_config.bat
for /f "tokens=1,2 delims=," %%a in (..\haima_init_program\config.ini) do  set %%a=%%b

echo %MyDocDir%
echo %SavedGameDir%
echo %AppDataDir%
echo %LocalAppDataDir%
echo %LocalLow%
echo %ProgramDataDir%
echo %LocalUser%
echo %LocalPublic%
echo %cddir%
echo %gamedir%
echo %DisplayCardName%
echo %steampath%
echo %onlinegamepath%
echo %uplaygamepath%
echo %epicgamepath%

echo 清理配置
start /wait /min .\hm_init\hm_clean.bat
md "C:\Users\Administrator\Documents\"
md "C:\Users\Public\Documents\"

echo 拔插手柄驱动,有问题时再使用
::C:\HM-GameServer\bins\ScpXGamePad.exe uninstall 2

echo 覆盖配置
c:\Windows\System32\reg.exe import ".\hm_init\all\config_1\naraka.reg"
copy /y ".\hm_init\all\config_2\QualitySettingsData.txt"  "M:\hm_epic_game\Naraka\program\NarakaBladepoint_Data\QualitySettingsData.txt"
xcopy .\hm_init\all\config_3  "%AppDataDir%\Netease\Mpay" /e /y /i /c

exit 0
@echo off & call :VAR %*
title %~n0 ^| %DATE% ^|^| %TIME%












:VAR {
for %%i in (
RC
DT
EV
) do call :%%~i %*

echo:

echo:"%~0"|find "%~n0"||exit/b



:RC {

set rclone_progress=

set rclone_use_mmap=true
set rclone_fast_list=true
set rclone_copy_links=true
set rclone_ignore_case=true

set rclone_checksum=
set rclone_delete_empty_src_dirs=true


set rclone_drive_acknowledge_abuse=true
set rclone_drive_server_side_across_configs=true

exit/b
} /RC



:DT {
for /f "useback tokens=2 delims==." %%i in (`wmic os get localdatetime /value`) do set dt=%%i

set ddate=%DT:~,8%
set ttime=%DT:~8,6%

:HMS

set hour=%TIME:~,2%
set hour=%HOUR: =0%

set minute=%TIME:~3,2%
set second=%TIME:~6,2%
set millisecond=%TIME:~-2%

set hms=%HOUR%h%MINUTE%m%SECOND%s
set tdot=%HOUR%.%MINUTE%.%SECOND%



:YMD

set day=%DATE:~7,2%
set year=%DATE:~-4%
set today=%DATE:~7,2%
set month=%DATE:~4,2%
set weekday=%DATE:~,3%

:YMD_ALIAS

set ymd=%YEAR%-%MONTH%-%DAY%
set wymd=%WEEKDAY%_%YMD%
set ymdw=%YMD%_%WEEKDAY%
set dymd=%WYMD%
set ymdd=%YMDW%
set wymdhms=%WYMD%-%HMS%




:NAMES

set today_names_stub=Sun Mon Tue Web Thu Fri Sat
set today_names_long=Sunday Monday Tuesday Wednesday Thursday Friday Saturday

set month_names_stub=Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
set month_names_long=January Feburary March April May June July August September October November December


:MONTH

for /f "useback tokens=%MONTH:0=%" %%i in ('%month_names_stub%') do set month_name_stub=%%i
for /f "useback tokens=%MONTH:0=%" %%i in ('%month_names_long%') do set month_name_long=%%i

exit/b

} /DT



:EV {

set HEX=0 1 2 3 4 5 6 7 8 9 A B C D E F
set aaz=a b c d e f g h i j k l m n o p q r s t u v w x y z
set ABC=A B C D E F G H I J K L M N O P Q R S T U V W X Y Z





exit/b

} /EV



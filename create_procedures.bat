@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

SET SERVER=Jacky
SET USER=sa
SET PASSWORD=89811858
SET DATABASE=TeaOrderDB

FOR %%F IN (Procedures\*.sql) DO (
    echo 執行 SQL 檔案：%%F
    sqlcmd -S %SERVER% -U %USER% -P %PASSWORD% -d %DATABASE% -i "%%F"
)

echo 所有 SQL 檔案已執行完成！
pause

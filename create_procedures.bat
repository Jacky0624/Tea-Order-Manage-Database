@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

SET SERVER=Jacky
SET USER=sa
SET PASSWORD=89811858
SET DATABASE=TeaOrderDB

FOR %%F IN (Procedures\*.sql) DO (
    echo ���� SQL �ɮסG%%F
    sqlcmd -S %SERVER% -U %USER% -P %PASSWORD% -d %DATABASE% -i "%%F"
)

echo �Ҧ� SQL �ɮפw���槹���I
pause

@echo off
setlocal enabledelayedexpansion

:: Ask for prefix, suffix, and month format
set /p prefix="Enter the prefix (e.g., Bulk Report): "
set /p suffix="Enter the suffix (e.g., 2025): "
set /p month_format="Enter month format (short or full): "

:: Define month names
set "months_short=Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec"
set "months_full=January February March April May June July August September October November December"

:: Validate month format
if /i "%month_format%" equ "short" (
    set "months=!months_short!"
) else if /i "%month_format%" equ "full" (
    set "months=!months_full!"
) else (
    echo Invalid month format. Please use "short" or "full".
    exit /b
)

:: Create folders
set count=1
for %%m in (!months!) do (
    set folder_name="%prefix% !count! %%m-%suffix%"
    echo Creating folder: !folder_name!
    mkdir !folder_name!
    set /a count+=1
)

echo All folders have been created.
pause

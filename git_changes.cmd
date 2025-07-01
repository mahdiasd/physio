@echo off
REM بررسی گیت ریپو بودن در مسیر جاری
git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
    echo این پوشه یک ریپوزیتوری گیت نیست.
    pause
    exit /b 1
)

REM گرفتن تغییرات گیت و ذخیره در فایل کنار اسکریپت
setlocal
set script_dir=%~dp0
git status > "%script_dir%git_change.text"
start "" "%script_dir%git_change.text"
endlocal
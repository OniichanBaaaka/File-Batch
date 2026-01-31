@echo off
title Tao Va Chay Web ASP.NET Core


:: --- 1. KIEM TRA MOI TRUONG ---
dotnet --version >nul 2>&1
if %errorlevel% neq 0 (
    color 0C
    echo [LOI] May tinh chua cai .NET SDK.
    echo Vui long cai dat tai dotnet.microsoft.com
    pause
    exit
)

echo ==================================================
echo   TAO DU AN ASP.NET CORE MVC + AUTO RUN
echo ==================================================

:: --- 2. NHAP TEN DU AN ---
set /p projectName="Nhap ten du an (VD: MyShop): "
if "%projectName%"=="" goto Error

:: --- 3. TAO PROJECT ---
echo.
echo [1/4] Dang tao project "%projectName%"...
dotnet new mvc -n %projectName%
if %errorlevel% neq 0 goto Error

cd %projectName%

:: --- 4. CAI DAT CHUNG CHI HTTPS (Quan trong) ---
:: Buoc nay giup trinh duyet khong bao loi "Bao mat" mau do
echo.
echo [2/4] Dang cai dat chung chi HTTPS...
dotnet dev-certs https --trust

:: --- 5. MO CONG CU LAP TRINH ---
echo.
start .
:: start "" "%projectName%.csproj"

:: --- 6. CHAY DU AN ---
echo.
echo [4/4] DANG KHOI DONG SERVER WEB...
echo ==================================================
echo   LUU Y QUAN TRONG:
echo   1. Cho mot lat de web tai thu vien (Restore).
echo   2. Web se tu dong bat len trinh duyet.
echo   3. De dung web, hay nhan to hop phim: Ctrl + C
echo ==================================================
echo.

:: Lenh nay se chay web va theo doi chinh sua (Hot Reload)
dotnet watch run

pause
exit

:Error
echo.
echo [LOI] Co loi xay ra hoac ban chua nhap ten.
pause

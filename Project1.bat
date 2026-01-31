@echo off



:: --- 1. KIEM TRA .NET ---
dotnet --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [LOI] May tinh chua cai .NET SDK!
    pause
    exit
)


:: --- 2. NHAP TEN ---
set /p projectName="Nhap ten du an (VD: MyWeb): "
if "%projectName%"=="" goto Error

:: --- 3. TAO PROJECT ---
echo.
echo Dang tao project "%projectName%"...
dotnet new mvc -n %projectName%

if %errorlevel% neq 0 (
    echo [LOI] Ten du an khong hop le.
    pause
    exit
)

:: --- 4. MO DU AN (OPEN LUON) ---
cd %projectName%

echo.
echo ==================================================
echo DA XONG! DANG MO PROJECT...
echo ==================================================

:: 1. Mo thu muc chua file (File Explorer)
start .



:: 3. (Tuy chon) Neu ban dung Visual Studio 2022 (Icon Tim), no se mo file .csproj
:: start "" "%projectName%.csproj"

exit

:Error
echo Ban chua nhap ten!
pause
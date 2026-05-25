@echo off
setlocal

REM ============================================================
REM ROOTS
REM ============================================================

set ROOT=C:\Users\nxf97418\synopsys\V-2024.03-20260315-1200\VirtualizerRuntime\VDK\S32K388_System\R7.1.0_OP\NXP_S32K388_System

set SLS=C:\Users\nxf97418\synopsys\V-2024.03-20260315-1200\VirtualizerRuntime\SLS\windows

REM ============================================================
REM ENVIRONMENT
REM ============================================================

set SNPS_VP_HOME=%SLS%
set SNPS_VP_PRODUCT=S32K388_System
set COWAREHOME=%SLS%

REM ============================================================
REM MAIN PATHS
REM ============================================================

set PATH=%ROOT%\bin;%PATH%

set PATH=%ROOT%\bin\InnoRuntime;%PATH%
set PATH=%ROOT%\bin\InnoRuntime\Libraries;%PATH%
set PATH=%ROOT%\bin\InnoRuntime\Libraries\runtime;%PATH%

set PATH=%ROOT%\bin\InnoRuntime\Libraries\runtime\codebase;%PATH%
set PATH=%ROOT%\bin\InnoRuntime\Libraries\runtime\codebase\msvc-14.34-64;%PATH%

set PATH=%SLS%\common\libso-msvc-14.34-64;%PATH%
set PATH=%SLS%\pc\lib;%PATH%
set PATH=%SLS%\dmtools\lib;%PATH%

REM ============================================================
REM VRE RUNTIME
REM ============================================================

set VRE_LIBRARY_PATH=%ROOT%\bin\InnoRuntime\Libraries\runtime
set VRE_MAP_PATH=%ROOT%\bin\InnoRuntime\Libraries\runtime

REM ============================================================
REM DEBUG INFO
REM ============================================================

echo.
echo ============================================================
echo ROOT=%ROOT%
echo SLS=%SLS%
echo ============================================================
echo.

echo CHECKING IMPORTANT FILES...
echo.

if exist "%ROOT%\bin\simulation\sim.exe" (
    echo sim.exe FOUND
) else (
    echo sim.exe MISSING
)

if exist "%ROOT%\bin\InnoRuntime\InnoRuntime.dll" (
    echo InnoRuntime.dll FOUND
) else (
    echo InnoRuntime.dll MISSING
)

if exist "%ROOT%\bin\InnoRuntime\Libraries\runtime\vreiftouuid.map" (
    echo vreiftouuid.map FOUND
) else (
    echo vreiftouuid.map MISSING
)

if exist "%SLS%\common\libso-msvc-14.34-64\SnpsVP.dll" (
    echo SnpsVP.dll FOUND
) else (
    echo SnpsVP.dll MISSING
)

echo.
echo ============================================================
echo STARTING SIMULATION
echo ============================================================
echo.

cd /d "%ROOT%\bin\simulation"

"%ROOT%\bin\simulation\sim.exe" --cwr_nosession

pause
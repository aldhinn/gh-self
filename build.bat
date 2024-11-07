@rem Run this script if you're using windows.

setlocal
@echo off

set "docker_exe=docker.exe"

where %docker_exe% > nul 2>&1
if %errorlevel% neq 0 (
    echo Please install docker in your system.
    exit /b 1
)

@rem The directory where this script exists.
set "script_dir=%~dp0"

endlocal
@rem End of line.
@rem DO NOT WRITE BEYOND HERE.
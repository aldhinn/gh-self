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

@rem Build amd64 linux base image.
%docker_exe% build -t gh-self:amd64-linux-base --build-arg RUNNER_VERSION=2.320.0 \
    --build-arg GH_PLATFORM=x64 %script_dir%\linux

endlocal
@rem End of line.
@rem DO NOT WRITE BEYOND HERE.
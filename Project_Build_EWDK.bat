@echo off
REM	======= User Configuration Area [Start] =======
REM     rebuild = make rebuild
REM     clean   = make clean
REM     only gen token.h/asl/.. = make sdl
REM	set VEB_FILE_NAME=Cannonlake
	set BUILD_COMMAND=make %1
	set BIOS_PROJ_DIR=%CD%
	set VEB_TOOLS_DIR=D:\BuildTools\BuildTools_32.1\Tools
	set EWDK_DIR=D:\EWDK
	set JAVA_BIN_LINK=C:\ProgramData\Oracle\Java\javapath
REM	======= User Configuration Area [End] =======


REM ======= Function "Main" =======
:FUNC_MAIN
@echo off
set       VEB=%VEB_FILE_NAME%
rem set  CCX86DIR=%WINDDKx86_DIR%\x86
rem set  CCX64DIR=%WINDDKx86_DIR%\amd64
set TOOLS_DIR=%VEB_TOOLS_DIR%
set      PATH=%VEB_TOOLS_DIR%;%WEWDK_DIR%;%JAVA_BIN_LINK%;C:\windows\system32;%path%

echo +---------------------------+
echo ^| Set BIOS Proj. Build Env. ^|
echo +---------------------------+
echo       VEB=%VEB_FILE_NAME%
echo  CCX86DIR=%CCX86DIR%
echo  CCX64DIR=%CCX64DIR%
echo TOOLS_DIR=%TOOLS_DIR%
echo      PATH=%PATH%
echo.
echo +---------------------------+
echo ^| Start To Build BIOS Proj. ^|
call :FUNC_SET_CURRENT_DATE_TIME_STR_FOR_FILE_NAME
echo ^| %DATE_STR_FOR_FILE_NAME% %TIME_STR_FOR_FILE_NAME% ^|
echo +---------------------------+
cd /d "%BIOS_PROJ_DIR%"
%BUILD_COMMAND%
echo.
echo +---------------------------+
echo ^| Build BIOS Proj. Finished ^|
call :FUNC_SET_CURRENT_DATE_TIME_STR_FOR_FILE_NAME
echo ^| %DATE_STR_FOR_FILE_NAME% %TIME_STR_FOR_FILE_NAME% ^|
echo +---------------------------+
pause
goto :EOF

REM ======= Function "Set Current Date Time String For File Name": Will Update DATE_STR_FOR_FILE_NAME And TIME_STR_FOR_FILE_NAME Variables =======
REM References: http://alexchuo.blogspot.tw/2006/07/blog-post.html
:FUNC_SET_CURRENT_DATE_TIME_STR_FOR_FILE_NAME
for /f "tokens=1-3 delims=:/" %%a in ("%date%") do (set DATE_STR_FOR_FILE_NAME=%%a-%%b-%%c)
for /f "tokens=1-3 delims=:/" %%a in ("%time%") do (set TIME_STR_FOR_FILE_NAME=%%ah-%%bm-%%cs)
goto :EOF
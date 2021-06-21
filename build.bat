cd %~dp0
IF NOT EXIST shaders mkdir shaders
%VULKAN_SDK%\Bin\glslc.exe shader.vert -o shaders\vert.spv
%VULKAN_SDK%\Bin\glslc.exe shader.frag -o shaders\frag.spv

@REM Build for Visual Studio compiler. Run your copy of amd64/vcvars32.bat to setup 64-bit command-line compiler.

@set INCLUDES=/I %VULKAN_SDK%\include /I includes
@set SOURCES=main.cpp
@set LIBS=/libpath:%VULKAN_SDK%\lib glfw3.lib opengl32.lib gdi32.lib shell32.lib vulkan-1.lib user32.lib
@set OUT_EXE=MyVulkanApplication

@set OUT_DIR=Debug
IF NOT EXIST %OUT_DIR% mkdir %OUT_DIR%
cl /nologo /std:c++17 /EHsc /nologo /Zi /MD %INCLUDES% %SOURCES% /Fe%OUT_DIR%/%OUT_EXE%.exe /Fo%OUT_DIR%/ /link %LIBS%
%~dp0/Debug/MyVulkanApplication.exe

@REM @set OUT_DIR=Release
@REM mkdir %OUT_DIR%
@REM cl /nologo /Zi /MD /Ox /Oi %INCLUDES% %SOURCES% /Fe%OUT_DIR%/%OUT_EXE%.exe /Fo%OUT_DIR%/ /link %LIBS%


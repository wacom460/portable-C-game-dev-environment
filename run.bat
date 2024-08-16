@echo off
:top
cls
cd ext/raylib
"../tcc/tcc.exe" -w -I. -c core.c -std=c99 -Wall -Iexternal/glfw/include -DGRAPHICS_API_OPENGL_33 -DPLATFORM_DESKTOP -DSTBI_NO_SIMD
"../tcc/tcc.exe" -w -I. -c rglfw.c -std=c99 -Wall -DPLATFORM_DESKTOP -DSTBI_NO_SIMD
"../tcc/tcc.exe" -w -I. -c shapes.c -std=c99 -Wall -DPLATFORM_DESKTOP -DSTBI_NO_SIMD
"../tcc/tcc.exe" -w -I. -c textures.c -std=c99 -Wall -DPLATFORM_DESKTOP -DSTBI_NO_SIMD
"../tcc/tcc.exe" -w -I. -c text.c -std=c99 -Wall -DPLATFORM_DESKTOP -DSTBI_NO_SIMD
"../tcc/tcc.exe" -w -I. -c models.c -std=c99 -Wall -DPLATFORM_DESKTOP -DSTBI_NO_SIMD
"../tcc/tcc.exe" -w -I. -c raudio.c -std=c99 -Wall -DPLATFORM_DESKTOP -DSTBI_NO_SIMD -DMAL_NO_WASAPI
"../tcc/tcc.exe" -w -I. -c utils.c -std=c99 -Wall -DPLATFORM_DESKTOP -DSTBI_NO_SIMD
"../tcc/tcc.exe" -ar rcs libraylib.a core.o rglfw.o shapes.o textures.o text.o models.o raudio.o utils.o
del core.o rglfw.o shapes.o textures.o text.o models.o raudio.o utils.o
cd..
cd..
"./ext/tcc/tcc.exe" ^
src/*.c ^
-Isrc ^
-Iext/inc ^
-Iext/raylib ^
-Lext/raylib ^
-lmsvcrt ^
-lraylib ^
-lopengl32 ^
-lgdi32 ^
-lwinmm ^
-lkernel32 ^
-lshell32 ^
-luser32 ^
-o program.exe
del ext\raylib\libraylib.a
if %errorlevel% neq 0 (
	pause
	goto :top
)
program.exe
if %errorlevel% neq 0 pause
goto :top
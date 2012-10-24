@REM \FreeBASIC\fbc.exe -r test.bas

@REM \FreeBASIC\fbc.exe -exx -g test.bas

@REM \FreeBASIC\fbc.exe -s gui test.bas resource.rc

@\FreeBASIC\fbc.exe test.bas resource.rc

@REM MOVE /y test.exe ..\

@DEL *.obj

@REM PAUSE

@echo off
rem Postinstall scripts are always started from the Msys root dir
rem so we can just call dash from here
path .\bin;%path%
dash /bin/rebaseall -p

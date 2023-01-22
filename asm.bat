@echo off

debug < %1.asm > %1.log

find /n /i "Erreur" %1.log

rem @debug
rem type %1.log


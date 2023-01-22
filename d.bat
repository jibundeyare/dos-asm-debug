@echo off

debug < %1.d | find /n /i "Erreur"

rem @debug
rem debug < %1.d


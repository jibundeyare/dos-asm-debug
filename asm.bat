@echo off

debug < %1.asm > %1.log
type %1.log


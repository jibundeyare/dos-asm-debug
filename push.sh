#!/bin/bash

target_dir="../0-floppy/dbg"

./mnt.sh

unix2dos -q *.bat
cp asm.bat $target_dir
cp d.bat $target_dir

unix2dos -q *.asm
unix2dos -q *.d
cp *.asm $target_dir
cp *.d $target_dir

./umnt.sh


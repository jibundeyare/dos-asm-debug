#!/bin/bash

target_dir="../0-floppy/dbg"

./mnt.sh

unix2dos -q *.bat
cp asm.bat $target_dir
cp d.bat $target_dir
cp t.bat $target_dir

unix2dos -q *.asm
cp *.asm $target_dir

unix2dos -q *.d
cp *.d $target_dir

count="$(ls -1 *.t 2>/dev/null | wc -l)"

if [ $count != "0" ]; then
	unix2dos -q *.t
	cp *.t $target_dir
fi

./umnt.sh


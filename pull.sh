#!/bin/bash

target_dir="../0-floppy/dbg"

./mnt.sh

cp $target_dir/*.COM ./
cp $target_dir/*.LOG ./
cp $target_dir/*.TO ./

chmod -x *.COM
chmod -x *.LOG
chmod -x *.TO

IFS_BACKUP=$IFS
IFS=$(echo -en "\n\b")

# rename *.COM to lower case
files="$(ls -1 *.COM)"
for f in $files; do
	mv "${f}" "${f,,}"
done

# rename *.LOG to lower case
files="$(ls -1 *.LOG)"
for f in $files; do
	mv "${f}" "${f,,}"
done

# rename *.TO to lower case
files="$(ls -1 *.TO)"
for f in $files; do
	mv "${f}" "${f,,}"
done

# restore $IFS
IFS=$IFS_BACKUP

./umnt.sh


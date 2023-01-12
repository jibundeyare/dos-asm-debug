#!/bin/bash

target_dir="../0-floppy/dbg"

./mnt.sh

cp $target_dir/*.LOG ./
cp $target_dir/*.COM ./

chmod -x *.LOG
chmod -x *.COM

./umnt.sh


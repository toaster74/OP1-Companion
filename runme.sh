#!/bin/bash

cd ~/OP1-Companion
for SCRIPT in ./[0-9]*.sh
do
if [ -f $SCRIPT -a -x $SCRIPT ]
then
echo "--- running $SCRIPT"
$SCRIPT
fi
done

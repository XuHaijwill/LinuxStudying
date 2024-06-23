#!/bin/bash

sh ./test.sh
ret=$?
if [ $ret -eq -1 ]; then
	echo " test.sh failed."
fi
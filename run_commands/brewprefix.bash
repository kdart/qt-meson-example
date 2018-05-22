#!/bin/bash

IFS=$'\n'
for line in $(brew config) ; do
	if [ ${line:0:15} = HOMEBREW_PREFIX ] ; then
		echo ${line:17}
	fi
done

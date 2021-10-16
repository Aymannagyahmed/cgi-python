#!/bin/bash
## Exite codes
#		0: Success, and build
#		1: Dataset file is not found
#		2: sum.sh is not found
#		3: Wrong result

MAINDIR="/github/workspace"
#MAINDIR="."
#Sure that the script has x permission
chmod +x sum.sh
if [ ! -f ${MAINDIR}/sum.sh ]
then
		exit 2
fi

if [ ! -f ${MAINDIR}/datase.txt ]
then
		exit 1
fi

while read LINE
do
		NUM1=$(echo ${LINE}| cut -f 1 -d" ")
		NUM2=$(echo ${LINE}| cut -f 2 -d" ")
		RESULT=$(echo ${LINE}| cut -f 3 -d" ")
		CALCRESULT=$(./sum.sh ${NUM1} ${NUM2})
		if [ ${CALCRESULT} -NE ${RESULT} ]
		then
				exit 3
				
done < ${MAINDIR}.datase.txt
exit 0
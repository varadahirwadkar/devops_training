#!/bin/bash

factorial(){
if [ $1 -gt 1 ]; then
	i=`expr $1 - 1`
	j=`factorial $i`
	k=`expr $1 \* $j`
	echo $k
else
	echo 1
fi
}

mycounter=3
re='^[0-9]+$'
while [ $mycounter -gt 0 ]
do
	echo "Enter a number:"
	read no
	if [[ $no =~ $re ]]
	then
		factorial $no
		mycounter=`expr $mycounter - 1`
	else
		echo "Please enter number"
	fi
done

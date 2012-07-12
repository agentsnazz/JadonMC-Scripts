#!/bin/bash

output="output"

while read line
do
	#echo $line
	
	# Strip that brackety shit
	world='\[*\]'
	line=${line/$world/}
	#echo $line
	
	words=($line)
	
	name=${words[0]}
	#echo $name

	verb=${words[1]}
	verb=${verb/\:/}
	#echo $verb

	case $verb in
		quit)
			datestamp=${words[2]}
			datestamp=${datestamp/\(/}
			#echo $datestamp
			
			timestamp=${words[3]}
			timestamp=${timestamp/\)/}
			#echo $timestamp
			;;
		joined)
			datestamp=${words[6]}
			datestamp=${datestamp/\(/}
			#echo $datestamp
			
			timestamp=${words[7]}
			timestamp=${timestamp/\)/}
			#echo $timestamp
			;;
		*)
			echo "ERROR: Can't determine quit/joined verb!"
			;;
	esac
	
	if [ ! -d $output ]; then
		mkdir $output
	fi
	rm -f ./$output/$name.log
	echo -e $name'\t'$verb'\t'$datestamp $timestamp >> ./$output/$name.log

done < $1

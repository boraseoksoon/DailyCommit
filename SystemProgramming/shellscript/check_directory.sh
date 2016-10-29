#/bin/bash

NUMBER_OF_ARGUMENT=$#
MAXIMUM_ALLOWED_ARGUMENT=1

# echo $NUMBER_OF_ARGUMENT, $MAXIMUM_ALLOWED_ARGUMENT  

if [ $NUMBER_OF_ARGUMENT -gt $MAXIMUM_ALLOWED_ARGUMENT ]; 
then
	echo "try again. too much argument.."
	exit 1
elif [ $NUMBER_OF_ARGUMENT -eq $MAXIMUM_ALLOWED_ARGUMENT ]; 
then
	echo "nice argument number. let's check if this is proper directory or not."
	
	DIRECTORY=$1
	CHECK_TIME=1

	if [ -d "$DIRECTORY" ]; then
		# Control will enter here if $DIRECTORY exists.
		echo "$DIRECTORY is exist"

		
		while :;
		do
			echo "check the status of the directory $DIRECTORY per every single $CHECK_TIME second."
			ls -la $1;	
			sleep $CHECK_TIME;
			clear;
		done

	else
		echo "$DIRECTORY does not exist OR not a type of directory"
	fi

else
	echo "try again. less argument..."
	exit 1
fi


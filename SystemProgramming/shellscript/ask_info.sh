#! /bin/bash
# prompt for user name.


echo "Please enter your name:"
read USER_NAME

# Check for the file.

if [ -s ${USER_NAME}_DAT ]; then
        # Read the age from the file.
        AGE=`cat ${USER_NAME}_DAT`
        echo "Hello, $USER_NAME!, You are $AGE years old!"
else
        # Ask the user for his/her age
        echo "Hey, $USER_NAME, How old are you?"
        read AGE

	if [ "$AGE" -le 2 ]; then
		echo "You are too young!"
	else
		if [ "$AGE" -ge 100 ]; then
			echo "You are too old!"
		else
        		# Write the age to a new file.
        		echo $AGE > ${USER_NAME}_DAT
        	fi
        fi
fi

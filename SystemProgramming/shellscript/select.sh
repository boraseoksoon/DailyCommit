
echo "What is your favourite OS ?"
	select var in "Linux" "Free BSD" "Windows" "Solaris" "Other"
	do
		break
	done
	echo "You have selected $var"

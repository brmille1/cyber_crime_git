#! /bin/bash

##Check if the user provided an argument
if [ -z "$1" ]; then
	echo "Please provide a directory"
	exit 1
fi

#Get the directory from the agrument
directory_name="$1"

#Check if directory_name is a directory
if [ ! -d "$directory_name" ]; then
	echo "$directory_name is not a directory"
	exit 1
fi

#Loop through the directory
for file in "$directory_name"/*; do
	#Check if it is a file
	if [ -f "$file" ]; then
		#Show file name
		echo "$file"

		#Show file contents
		cat < "$file"
	fi
done


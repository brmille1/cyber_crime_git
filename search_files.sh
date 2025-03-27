#! /bin/bash

#Prompt user for directory path
echo "Input directory path:"

#Get path from user
read dir_path

#Check if dir_path is not a valid directory
if [ ! -d "$dir_path" ]; then
	echo "$dir_path is not a directory"
	exit 1
fi

#Prompt user for what they want to search for
echo "Text to search for:"

#Get text to search for from user
read search_text

#Use grep to look for search_text within the files in dir_path
grep -i -r "$search_text" "$dir_path"

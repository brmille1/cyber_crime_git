#! /bin/bash

#Directory to target for script
target_directory="$1"

#Number of files to make in each directory
file_number="$2"

#Loop through all of the directories
for dir in $(find "$target_directory" -type d); do
    #Loop for the value of file_number
    for i in $(seq 1 $file_number); do
        #Create a file with the name of the current directory and value of i
        filePath="$dir/$i.txt"

        #Get the fullPath for the new file to make
        fullPath=$(realpath "$filePath")

        #Make the file and put the file's md5 hash in it
        echo "$fullPath" | md5sum | awk '{ print $1 }' > "$filePath"
    done
done
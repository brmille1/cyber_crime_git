#! /bin/bash

#Prompt for user input
echo "Number of files to make:"

#Read user input for number of files
read fileNumber

#Check if files directory exists
if test -d /home/kali/Documents/files; then

	#Use for loop to create files
	for ((i=0 ; i<fileNumber ; i++)); do

		#Check if i is less than 10
		if [ $i -lt 10 ]; then
       			#Name file with extra 0
			fileName=file0$i.txt
		else
			#Name file without 0
			fileName=file$i.txt
		fi

		#Create the file with fileName
		touch /home/kali/Documents/files/$fileName

		#Make file readable, writable, and executable
		chmod 777 /home/kali/Documents/files/$fileName

		#Generate MD5 hash for file
		fileHash=$(md5sum /home/kali/Documents/files/$fileName)

		#Append file's hash to it
		echo $fileHash > /home/kali/Documents/files/$fileName
	done
else
	#Warn user file does not exist
	echo "files directory does not exist"
fi


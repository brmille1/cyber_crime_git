#! /bin/bash

# Check if users.txt exists
if [ ! -f users.txt ]; then
	echo "Error: users.txt not found!"
	exit 1
fi

# Loop through each username in users.txt
while IFS= read -r username ; do
	#Skip empty lines
	if [ -z "$username" ]; then
		continue
	fi

	# Check if user already exists
	if id "$username" &>/dev/null; then
		echo "User $username already exists, skipping."
		continue
	fi

	# Create user with home directory
	useradd -m -s /bin/bash "$username"

	# Set password same as username
	echo "$username:$username" | chpasswd

	echo "User $username created successfully."
done < users.txt

echo "All users processed successfully!"

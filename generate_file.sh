#!/bin/bash

# Set number of records to generate (default: 50)
n=${1:-50}
output="output.txt"

# Check if output file exists
if [ -f "$output" ]; then
    read -p "$output already exists. Overwrite? (y/n): " confirm
    if [ "$confirm" != "y" ]; then
        echo "Aborted."
        exit 1
    fi
fi

# Arrays of common names
first_names=(john mary alice bob emily james sarah david laura kevin megan steve linda chris karen tom)
last_names=(smith jones taylor brown davis wilson moore thomas white hall lewis allen king scott green)

# Helper: generate 12-character padded field
pad12() {
    printf "%-12.12s" "$1"
}

# Helper: generate random 10-digit phone number
rand_phone() {
    digits=""
    for i in $(seq 1 10); do
        digits+=$(( RANDOM % 10 ))
    done
    echo "$digits"
}

# Helper: generate random-looking email
rand_email() {
    user=$(head /dev/urandom | tr -dc ’a-z’ | head -c6)
    domain=$(shuf -n1 -e gmail.com yahoo.com example.com outlook.com)
    echo "$user@$domain"
}

# Generate records
> "$output"
for i in $(seq 1 $n); do
    fname=${first_names[$RANDOM % ${#first_names[@]}]}
    lname=${last_names[$RANDOM % ${#last_names[@]}]}
    lname_upper=$(echo "$lname" | tr ’[:lower:]’ ’[:upper:]’)
    phone=$(rand_phone)
    email=$(rand_email)
    echo -n "$(pad12 "$fname")" >> "$output"
    echo -n "$(pad12 "$lname_upper")" >> "$output"
    printf "%-10s " "$phone" >> "$output"
    echo "$email" >> "$output"
done

echo "$n records written to $output"
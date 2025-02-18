#!/bin/bash

# Read input (similar to fgets(STDIN) in PHP)

read input

# Split the input into X, Y, and N (equivalent to list($X, $Y, $N) in PHP)

IFS=' ' read -r X Y N <<< "$input"

# Loop through numbers from 1 to N

for ((i=1; i<=N; i++))

do

# Check if divisible by both X and Y (FizzBuzz)

if (( i % X == 0 && i % Y == 0 )); then

echo "FizzBuzz"

# Check if divisible only by X (Fizz)

elif (( i % X == 0 )); then

echo "Fizz"

# Check if divisible only by Y (Buzz)

elif (( i % Y == 0 )); then

echo "Buzz"

# Otherwise, print the number

else

echo "$i"

fi

#!/bin/bash

echo "Input number:"

#Read user input
read num

for((i=1;i<=$num;i++)); do
	if (( i % 3 == 0 && i % 5 == 0 ))
	then
		echo "FizzBuzz"
	elif (( i % 3 == 0 ))
	then
		echo "Fizz"
	elif (( i % 5 == 0 ))
	then
		echo "Buzz"
	else
		echo $i
	fi
done
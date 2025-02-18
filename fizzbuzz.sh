#! /bin/bash

#Read user input
read num1 num2 num3

for((i=1;i<=$num3;i++))
do
	if (( i % num1 == 0 && i % num2 == 0 ))
	then
		echo "FizzBuzz"
	elif (( i % num1 == 0 ))
	then
		echo "Fizz"
	elif (( i % num2 == 0 ))
	then
		echo "Buzz"
	else
		echo $i
	fi
done

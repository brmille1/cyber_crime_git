#! /bin/bash

echo "Input string to repeat:"

read repeat_string

echo "Input number:"

read num

for((i=0;i<num;i++)); do
    echo $repeat_string
done
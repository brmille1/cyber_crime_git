#! /bin/bash

#Addition function
add()
{
    local num1="$1"
    local num2="$2"
    local result=$((num1 + num2))

    #Output result
    echo "$num1 + $num2 = $result"
}

#Subtraction function
subtract()
{
    local num1="$1"
    local num2="$2"
    local result=$((num1 - num2))

    #Output result
    echo "$num1 - $num2 = $result"
}

#Multiplication function
multiply()
{
    local num1="$1"
    local num2="$2"
    local result=$((num1 * num2))

    #Output result
    echo "$num1 * $num2 = $result"
}

#Division function
divide()
{
    local num1="$1"
    local num2="$2"
    local result=$((num1 / num2))

    #Output result
    echo "$num1 / $num2 = $result"
}

#Tell user how to end the loop
echo "End loop by inputing 'END' when asked for sign."

while [ true ]; do
    #Ask for user input
    echo "Input math sign:"
    echo "+ - * /"

    #Get math sign
    read mathSign

    #Check if user inputed 'END'
    if [ "$mathSign" = "END" ]; then
        break
    fi

    #Empty line
    echo

    #Ask for numbers
    echo "Input two numbers:"

    #Get numbers
    read num1 num2

    #Empty line
    echo

    #Depending on sign, do appropriate math
    if [ "$mathSign" = "+" ]; then
        add $num1 $num2
    elif [ "$mathSign" = "-" ]; then
        subtract $num1 $num2
    elif [ "$mathSign" = "*" ]; then
        multiply $num1 $num2
    elif [ "$mathSign" = "/" ]; then
        divide $num1 $num2
    fi

    #Empty line
    echo
done
#! /bin/bash

#Name of root directory to make
root=$1

#How many levels of directories to make
depth=$2

#How many directories to make on each level
breadth=$3

make_subdirs()
{
    #Create local variables for directory and depth
    local current_dir=$1
    local current_depth=$2

    #End function if we run out of depth
    if (($current_depth == 0)); then
        return
    fi

    #Loop for the breadth
    for i in $(seq 0 $(($breadth - 1))); do
        #Make a string to represent a subdirectory
        subdir=$(printf "\\$(printf '%03o' $((97 + i)))") #End of string is ASCI code, 97 is a, adds for different letters
        
        #Make the subdirectory a child of the current directory
        mkdir -p "$current_dir/$subdir"

        #Use recursion to run function again until current_depth is 0
        make_subdirs "$current_dir/$subdir" $(($current_depth - 1))
    done
}

#Make the root directory
mkdir -p "$root"

#Run make_subdirs to make the subdirectories
make_subdirs "$root" "$depth"
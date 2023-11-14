#!/bin/bash

#######################################################
# Rename files using a prefix string provided and add #
# sequential number, keeping the original extension.  #
# Written by William Medeiros medeiros.w17@gmail.com  #
#######################################################

# Check if arguments were provided
if [ $# -ne 3 ]; then
    echo "Usage: $0 <prefix> <folder_path> <extension>"
    exit 1
fi

counter=1
prefix="$1"
folder_path="$2"
extension="$3"

# Check if the folder path is valid
if [ ! -d "$folder_path" ]; then
    echo "Error: $folder_path is not a valid directory."
    exit 1
fi

# Rename the files
for file in "$folder_path"/*."$extension"; do
    if [ -f "$file" ]; then
        mv "$file" "${folder_path}/${prefix}_${counter}.$extension"
        ((counter++))
    fi
done

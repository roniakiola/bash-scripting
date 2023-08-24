#!/bin/bash

directory="$1"
shift
authors=("$@")

if [ -z "$directory" ]; 
  then
    echo "Please provide directory path as argument.
    Usage: ./assignment1.sh <directory name> <optional search parameters for names>
    Example: ./assignment1.sh fs15_teamwork sam jul"
    exit 1
fi

cd "$directory" || exit

if [ ${#authors[@]} -eq 0 ]; then
  git shortlog -sn | awk '{print $2 " - " $1}' > ../output.txt
else
  for name in "${authors[@]}"; do
    git shortlog -sn | grep -i "$name" | awk '{print $2 " - " $1}' > ../output.txt
  done
fi
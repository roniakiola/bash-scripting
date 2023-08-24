#!/bin/bash

directory="$1"
shift
components=("$@")

if [ -z "$directory" ] || [ ${#components[@]} -eq 0 ]; 
  then
    echo "Please provide directory path and component name(s) as argument.
    Usage: ./assignment2.sh <directory name> <search parameters for components>
    Example: ./assignment2.sh e-commerce-frontend-project button container"
    exit 1
fi

cd "$directory" || exit

declare -A component_counts

for component in "${components[@]}"; do
  count=$(grep -owri "</$component>" | wc -l)
  component_counts["$component"]=$count
done

for component in "${components[@]}"; do
  count=${component_counts["$component"]}
  echo "$component - $count times"
done

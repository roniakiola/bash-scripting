#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Give country names, please."
  exit 1
else
  for country in "$@"; do
    response=$(curl -s "https://restcountries.com/v3.1/name/${country}?fullText=true")
    
    name=$(echo "$response" | jq -r '.[0].name.common')
    capital=$(echo "$response" | jq -r '.[0].capital[0]')
    population=$(echo "$response" | jq -r '.[0].population')
    languages=$(echo "$response" | jq -r '.[0].languages')
    
    echo "Name: $name"
    echo "Capital: $capital"
    echo "Population: $population"
    echo "Languages: $languages"
  done
fi

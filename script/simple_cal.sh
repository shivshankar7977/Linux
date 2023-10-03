#!/bin/bash

read -p "First: " a 
read -p "Second: " b
read -p "Select (+,-,*,/): " c
if [[ $c == "+" ]]; then
	expr $a + $b
elif [[ $c == "-" ]]; then 
	expr $a - $b
elif [[ $c == "*" ]]; then
	expr $a \* $b
elif [[ $c == "/" ]]; then
	expr $a / $b
else
	echo "chal be " 
fi


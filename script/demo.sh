#!/bin/bash

# This is a comment

# Define variables
name="shivshankar"
age=24

# Echo/print statements
echo "Hello, $name!"
echo "You are $age years old."

# Arithmetic operations
x=10
y=5
sum=$((x + y))
difference=$((x - y))
product=$((x * y))
quotient=$((x / y))
remainder=$((x % y))

echo "Sum: $sum"
echo "Difference: $difference"
echo "Product: $product"
echo "Quotient: $quotient"
echo "Remainder: $remainder"

# Conditional statements (if-else)
if [ $x -gt $y ]; then
    echo "$x is greater than $y"
else
    echo "$x is not greater than $y"
fi

# Loop (for loop)
echo "Counting from 1 to 5:"
for i in {1..5}; do
    echo $i
done

# User input
read -p "Enter your favorite color: " color
echo "Your favorite color is $color."

# Command substitution
current_date=$(date)
echo "Current date and time: $current_date"

# Functions
say_hello() {
    echo "Hello from a function!"
}

say_hello  # Call the function

# File operations
file="example.txt"
echo "This is a test file." > $file  # Write to a file
echo "File contents:"
cat $file  # Read from a file

# Check if a file exists
if [ -e $file ]; then
    echo "$file exists."
else
    echo "$file does not exist."
fi

# Removing the file
rm $file
echo "$file has been removed."

# End of script


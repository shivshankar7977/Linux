#!/bin/bash

while true; do
    clear  # Clear the screen

    # Display the menu
    echo "Menu:"
    echo "1. Addition"
    echo "2. Subtraction"
    echo "3. Multiplication"
    echo "4. Division"
    echo "5. Modulus"
    echo "6. Square"
    echo "7. Cube"
    echo "8. Quit"

    # Read user input
    read -p "Enter your choice (1-8): " choice

    case $choice in
        1)
            # Addition
            read -p "Enter first number: " num1
            read -p "Enter second number: " num2
            result=$((num1 + num2))
            echo "Result: $result"
            ;;
        2)
            # Subtraction
            read -p "Enter first number: " num1
            read -p "Enter second number: " num2
            result=$((num1 - num2))
            echo "Result: $result"
            ;;
        3)
            # Multiplication
            read -p "Enter first number: " num1
            read -p "Enter second number: " num2
            result=$((num1 * num2))
            echo "Result: $result"
            ;;
        4)
            # Division
            read -p "Enter dividend: " num1
            read -p "Enter divisor: " num2
            if ((num2 == 0)); then
                echo "Error: Division by zero is not allowed."
            else
                result=$(bc <<< "scale=2; $num1 / $num2")
                echo "Result: $result"
            fi
            ;;
        5)
            # Modulus
            read -p "Enter first number: " num1
            read -p "Enter second number: " num2
            result=$((num1 % num2))
            echo "Result: $result"
            ;;
        6)
            # Square
            read -p "Enter a number: " num
            result=$((num * num))
            echo "Result: $result"
            ;;
        7)
            # Cube
            read -p "Enter a number: " num
            result=$((num * num * num))
            echo "Result: $result"
            ;;
        8)
            # Quit the script
            echo "Exiting..."
            exit 0
            ;;
        *)
            # Handle invalid choices
            echo "Invalid choice. Please select a valid option (1-8)."
            ;;
    esac

    read -p "Press Enter to continue..."
done


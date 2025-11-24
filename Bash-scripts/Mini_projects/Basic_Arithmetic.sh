:'Basic Arithmetic - Write a script that takes two numbers as input from the user and performs basic arithmetic operations (addition, subtraction, multiplication, and division) and then displays all the answers of those operations in the terminal.'
#!/bin/bash

echo " Enter first number: "
read num1
echo " Enter second number: "
read num2

# Perform arithmetic operations
if ! [[ "$num1" =~ ^-?[0-9]+$ ]] || ! [[ "$num2" =~ ^-?[0-9]+$ ]]; then
    echo " Error: Please enter valid integers."
    exit 1
fi
res_addtion=$((num1+num2))
res_subtraction=$((num1-num2))
res_multiplication=$((num1*num2))
res_division=$((num1/num2)) #handels only integer division
echo " Results of Arithmetic Operations: "
echo " Addition: $res_addtion"
echo " Subtraction: $res_subtraction"
echo " Multiplication: $res_multiplication"
echo " Division: $res_division"

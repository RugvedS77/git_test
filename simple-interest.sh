#!/bin/bash

# Simple Interest Calculator
# Formula: SI = (P * R * T) / 100

echo "---------------------------------------"
echo "  Simple Interest Calculator"
echo "---------------------------------------"

# Read Principal Amount
read -p "Enter the Principal amount: " p

# Read Rate of Interest
read -p "Enter the annual Rate of Interest (%): " r

# Read Time Period
read -p "Enter the Time period (in years): " t

# Basic validation to check if inputs are numeric
if [[ ! $p =~ ^[0-9.]+$ ]] || [[ ! $r =~ ^[0-9.]+$ ]] || [[ ! $t =~ ^[0-9.]+$ ]]; then
    echo "Error: Please enter valid numerical values."
    exit 1
fi

# Calculate Simple Interest using 'bc' for floating point math
# 'scale=2' ensures we get two decimal places
si=$(echo "scale=2; ($p * $r * $t) / 100" | bc)

# Calculate Total Amount
total=$(echo "scale=2; $p + $si" | bc)

echo "---------------------------------------"
echo "RESULTS:"
echo "Principal: $p"
echo "Interest Rate: $r%"
echo "Time Period: $t years"
echo "---------------------------------------"
echo "Total Interest: $si"
echo "Total Amount (Principal + Interest): $total"
echo "---------------------------------------"

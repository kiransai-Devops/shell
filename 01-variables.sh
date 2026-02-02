#!/bin/bash
# person1=$1
# person2=$2

# echo "$person1: hi $person2"
# echo "$person2: hi $person1"

# echo "enter your password "
# read -s PASSWORD
# echo "password is : $PASSWORD"

# echo "name is: $name"

# DATE=$(date)

# echo "timestamp excuted : $DATE"

starting_time=$(date +%s)

sleep 10

ending_time=$(date +%s)

total_time=$(($ending_time-$starting_time))

echo "executed time : $total_time"
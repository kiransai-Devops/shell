#!/bin/bash
# person1=$1
# person2=$2

# echo "$person1: hi $person2"
# echo "$person2: hi $person1"

# read variable----------------
# echo "enter your password "
# read -s PASSWORD (-s is used for hide the pass or pin)
# echo "password is : $PASSWORD"
# Environment variable------------
# echo "name is: $name"

# This variable is valid until this process is alive, it is accessible to sub prosess also
# By using "Export" 
# Once process is not alive there is a chance to access in user home location, open the".bashrc"file enter the value, after that apply the changes by using "source.bashrc" command

# Dynamic execution-------------
# DATE=$(date)
# echo "timestamp excuted : $DATE"

# starting_time=$(date +%s)
# sleep 10
# ending_time=$(date +%s)
# total_time=$(($ending_time-$starting_time))
# echo "executed time : $total_time"

# special variable-----------
# echo "all variables passed to the script:$@ "
# echo "all variables passed to the script:$* "

echo "Script name: $0"
echo "Current directory in script: $PWD"
echo "Who is running the script:$USER"
echo "Home directory of user: $HOME"
echo "Process instance id of the script: $$"
sleep 20 &
echo "Process instance id of the last command in background: $!"
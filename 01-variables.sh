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

# echo "Script name: $0"
# echo "Current directory in script: $PWD"
# echo "Who is running the script:$USER"
# echo "Home directory of user: $HOME"
# echo "Process instance id of the script: $$"
# sleep 20 &
# echo "Process instance id of the last command in background: $!"

# datatypes--------------
# NUM1=100
# NUM2=300
# SUM=$(($NUM1+$NUM2))
# echo "sum is : $SUM"

# NAMES=("sai" "kiran" "kiransai" "saikiran")
# echo "first name is : ${NAMES[0]}"
# echo "all names : ${NAMES[@]}"

# conditions---------
# NUM=$1

# if [ $NUM -lt 20 ]; then
#    echo "given number $NUM is less then to the 20"
# else
#    echo "given number $NUM is greter then to the 20"
# fi


# if [ $NUM -lt 20 ]; then
#    echo "given number $NUM is less then to the 20"
# elif [ $NUM -eq 20 ]; then
#    echo "given number $NUM is equal to the 20"
# else
#    echo "given number $NUM is greter then to the 20"
# fi


# echo "enter number:"
# read NUMBER

# if [ $(($NUMBER % 2)) -eq 0 ]; then
#    echo "given number $NUMBER is EVEN"
# else
#    echo "given number $NUMBER is ODD"
# fi


# USERID=$(id -u)

# if [ $USERID -eq 1 ]; then
#    echo "ERROR: please run this script with root privelege"
#    Exit 1
# fi

# dnf install mysql -y

# if [ $? -ne 0 ]; then
#    echo "ERROR: installing mysql is failure"
#    Exit 1
# else 
#    echo "installing mysql is SUCCESS"
# fi

# functions----------

# USERID=$(id -u)

# if [ $USERID -eq 1 ]; then
#    echo "ERROR: please run this script with root privelege"
#    Exit 1
# fi

# VALIDATE () { # functions revive inputs through args just like shell script args
#     if [ $1 -ne 0 ]; then
#        echo "ERROR: installing $2 is failure"
#        Exit 1
#     else 
#        echo "installing $2 is SUCCESS"
#    fi
# }

# dnf install mysql -y
# VALIDATE $? "mysql"

# dnf install nginx -y
# VALIDATE $? "nginx"

# colours--------

# USERID=$(id -u)
# R="\e[31m"
# Y="\e[33m"
# N="\e[0m"

# if [ $USERID -eq 1 ]; then
#    echo " $R ERROR $N : please run this script with root privelege"
#    Exit 1
# fi

# VALIDATE () { # functions revive inputs through args just like shell script args
#     if [ $1 -ne 0 ]; then
#        echo -e "installing $2 is  $R failure $N"
#        Exit 1
#     else 
#        echo -e "installing $2 is SUCCESS $Y skippping $N"
#    fi
# }

# dnf list installed mysql
# if [ $? -ne 0 ]; then
#    dnf install mysql -y
#    VALIDATE $? "mysql"
# else
#    echo -e "mysql already exist $Y skipping $N"
# fi

# dnf list installed nginx
# if [ $? -ne 0 ]; then
#    dnf install nginx -y
#    VALIDATE $? "nginx"
# else
#    echo -e "nginx already exist $Y skipping $N"
# fi

# logs and redirecting------------

USERID=$(id -u)
R="\e[31m"
Y="\e[33m"
N="\e[0m"

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOG_FOLDER # -p for command executed without faile if folder is already created or not 
echo "script started executed at : $(date)" | tee -a &>>$LOG_FILE # the command "tee -a" that shows on screen and stored also

if [ $USERID -eq 1 ]; then
   echo " $R ERROR $N : please run this script with root privelege"
   Exit 1
fi

VALIDATE () { # functions revive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then
       echo -e "installing $2 is  $R failure $N" | tee -a &>>$LOG_FILE
       Exit 1
    else 
       echo -e "installing $2 is SUCCESS $Y skippping $N" | tee -a &>>$LOG_FILE
   fi
}

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]; then
   dnf install mysql -y &>>$LOG_FILE
   VALIDATE $? "mysql"
else
   echo -e "mysql already exist $Y skipping $N" | tee -a &>>$LOG_FILE
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]; then
   dnf install nginx -y &>>$LOG_FILE
   VALIDATE $? "nginx"
else
   echo -e "nginx already exist $Y skipping $N" | tee -a &>>$LOG_FILE
fi

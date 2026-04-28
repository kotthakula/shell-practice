#!/bin/bash

USERID=$(id -u)
#echo "User ID is: $USERID"


CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then 
        echo "Please run this script with root priveleges"
        exit1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 is...FAILED"
        exit 1
    else
        echo "$2 is..SUCCESS"
}

CHECK_ROOT

dnf list installed git



if [$? -ne 0 ]
then
    echo "git is not installed.. going to install"
    dnf install git -y
    VALIDATE $? "Insatlling Git"
else
    echo "Git is already installed, nothing to do"

dnf list install mysql 

if [ $? -ne 0 ]
then
    echo "Mysql is not installed.. going to install"
    dnf install mysql -y
     VALIDATE $? "Insatlling Mql"
   
else
    echo "MYSqL is already installed, nothing to do"
fi


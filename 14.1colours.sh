#!/bin/bash


USERID=$(id -u)
#echo "User ID is: $USERID"

R="\e[31m"
G="\e[32m"
N="\e[0m"

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
        echo -e "$2 is...$R FAILED $N"
        exit 1
    else
        echo -e "$2 is..$G SUCCESS $N"
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


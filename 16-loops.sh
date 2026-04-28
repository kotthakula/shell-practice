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

#sh 16-loops.sh git mysql postfix nginx
for package in $@ #$@ refers to the passed to it
do 
    echo $package
done

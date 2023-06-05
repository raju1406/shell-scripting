#!/bin/bash
USERID=$(id -u)
DATE=$(date +"%F-%H-%M-%S")
LOG_FILE="$DATE.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
#check user is root or not
if [ $USERID -ne 0 ]
then
   echo "please run this script with root user access"
   exit 1
fi
#this is a generic function,we need to pass arguments
VALIDATE(){
if [ $1 -ne 0 ]
then
   echo -e "$2 ...$R failed $N"
   exit1
else
   echo -e "$2 ...$G success $N"
fi    
}
for PACKAGE in $@ #git vim wget net-tools
do
  yum -q list installed $PACKAGE &>>/dev/null
if [ $? -ne 0 ]
then
  echo "$PACKAGE..... Not installed"
  yum install $PACKAGE -y &>>LOG_FILE
  VALIDATE $? "$PACKAGE installation"
else
  echo -e "$PACKAGE.....$Y installed already $N"
fi
done  

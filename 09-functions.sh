#!/bin/bash
USERID=$(id -u)
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
   echo "$2 ...... failed"
   exit1
else
   echo "$2 .......success"
fi    
}
yum install git -y
VALIDATE $? "GIT installation"
yum install vim -y
VALIDATE $? "vim installation"
yum install wget -y
VALIDATE $? "wget installation"
yum install net-tools -y
VALIDATE $? "net-tools installation"    

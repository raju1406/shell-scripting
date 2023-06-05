#!/bin/bash
USERID=$(id -u)
if [ $USERID -eq 0 ]
then
   echo "user has root access"
else
   echo "you are not root user,please run with root privelage"
   exit 12
fi      
echo "installing GIT"
yum install git -y
if [ $? -eq 0 ]
then
   echo "installed Git successfully"
else
   echo "Git is not installed"
   exit 34
fi       

#!/bin/bash
echo "installing GIT"
yum install git -y
echo "installed GIT SUCCESSFULLY" # if (last line )this is success then linux consider overall script is success
ikkk #if this is last line file overall sceipt failure(echo $? =127=>faile)

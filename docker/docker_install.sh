#!/bin/bash
###
 # @Date: 2021-01-27 10:21:54
 # @LastEditors: ECarry
 # @Description: 使用 aliyuan 安装 docker
### 

set -e

# Only CentOS/RedHat7 x86_64 can run it.
function check_os(){

  platform=`uname -i`
  if [ $platform != "x86_64" ]
  then
    echo "this script is only for 64bit Operating System !"
    exit 1
  fi
  
  if [ ! -f /etc/redhat-release ] 
  then
    echo "this script is only for CentOS/RedHat 7 !"
    exit 1
  fi
  
  if ! cat /etc/redhat-release | cut -d " " -f4 | grep "^7.[0-9]" &> /dev/null
  then
    echo "this script is only for CentOS/RedHat 7 !"
    exit 1
  fi

} 

# Only root can run it.
USERID=`id -u`
if [ ! $USERID -eq 0 ]
then
  echo "This command must be run with root privileges."
  exit
fi


#!/bin/bash
###
 # @Date: 2020-09-22 20:53:02
 # @LastEditors: ECarry
 # @LastEditTime: 2020-09-27 09:18:25
 # @Description: 配置 linux 
### 

set -e

# Only CentOS/RedHat7 can run it.
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
  
  if ! cat /etc/redhat-release | grep "7.[0-9]" &> /dev/null
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

# 主目录
function Menu(){
cat <<EOF

Console setup
-------------

1) Netools
2) Manange User
3) Yum Config
4) Manage App
5) Power Off
6) Exit

EOF
}

echo "Check OS, Please wait..."
check_os
sleep 1

filepath=$(cd "$(dirname "$0")"; pwd)

index=-1

while (($index!=0))
do
  clear
  Menu
  read -p "Enter an option from 1-6: " index
  case $index in
    1)
    $filepath/netools/show_netools_menu.sh
    ;;
    2)
    $filepath/manage_user/show_manage_user_menu.sh
    ;;
    3)
    $filepath/yum_config/show_yum_menu.sh
    ;;
    4)
    $filepath/manage_app/show_manage_app.sh
    ;;
    5)
    $filepath/power/show_power_menu.sh
    ;;
    6)
    clear
    exit 0
    ;;
  esac
done 

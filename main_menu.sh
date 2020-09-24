#!/bin/bash
###
 # @Date: 2020-09-22 20:53:02
 # @LastEditors: ECarry
 # @LastEditTime: 2020-09-23 23:17:27
 # @Description: 配置 linux 
### 

set -e

# Only CentOS/RedHat can run it.
function check_os(){

  platform=`uname -i`
  if [ $platform != "x86_64" ];then
  echo "this script is only for 64bit Operating System !"
  exit 1
  fi
  echo "the platform is ok"
  sleep 2 
  if [ ! -f /etc/redhat-release ];then
  echo "this script is only for CentOS/RedHat !"
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

# 2) Manage User Menu
function Manage_User_meun(){
cat <<EOF

Manage User
-------------

1) Add User
2) Change Passwd
3) Add Group
4) Authorization
5) SSH
6) Return

EOF
}

# 3) Yum Config Menu
function Yum_Config_meun(){
cat <<EOF

Yum Config
------------- 

1) Change Repo
2) Yum Update
3) Return

EOF
}

# 4) Manage App Menu
function Service_Install_meun(){
cat <<EOF

Manage App
-------------

1) Install Nginx
2) Install Docker
3) Install Zabbix
4) Install MySQL
5) Install Python3
6) Return

EOF
}

# 5) Power Off Menu
function Power_Off_meun(){
cat <<EOF

Power Off
-------------

1) Reboot
2) Power Off
3) Return

EOF
}

echo "Check OS, Please wait..."
check_os
clear
filepath=$(cd "$(dirname "$0")"; pwd)

index=-1

Menu
while (($index!=0))
do
  read -p "Enter an option from 1-11: " index
  case $index in
    1)
    $filepath/netools/show_netools_menu.sh
    ;;
    2)
    Manage_User_meun
    ;;
    3)
    Yum_Config_meun
    ;;
    4)
    Service_Install_meun
    ;;
    5)
    Power_Off_meun
    ;;
    6)
    break
    ;;
  esac
done

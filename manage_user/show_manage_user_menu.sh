#!/bin/bash
###
 # @Date: 2020-09-25 11:32:13
 # @LastEditors: ECarry
 # @LastEditTime: 2020-09-25 11:52:00
 # @Description: 
### 

clear

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

filepath=$(cd "$(dirname "$0")"; pwd)
index=-1
Manage_User_meun
while (($index!=0))
do
  read -p "Enter an option from 1-4: " index
  case $index in
    1)
    $filepath/add_user.sh
    ;;
    2)
    $filepath/change_pw.sh
    ;;
    3)
    Yum_Config_meun
    ;;
    4)
    exit
    ;;
  esac
done
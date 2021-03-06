#!/bin/bash
###
 # @Date: 2020-09-23 23:02:31
 # @LastEditors: ECarry
 # @LastEditTime: 2020-09-27 09:28:22
 # @Description:  
### 

# 1) Netools Menu
function Netools_meun(){
cat <<EOF

Netools 
-------------

1) Configure Network Interfaces
2) Configure DNS
3) Restart Network
4) Return

EOF
}

filepath=$(cd "$(dirname "$0")"; pwd)

index=-1


while (($index!=0))
do
  clear
  Netools_meun
  read -p "Enter an option from 1-4: " index
  case $index in
    1)
    $filepath/if_config.sh
    ;;
    2)
    Manage_User_meun
    ;;
    3)
    Yum_Config_meun
    ;;
    4)
    exit
    ;;
  esac
done
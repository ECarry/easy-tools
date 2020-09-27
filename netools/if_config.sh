#!/bin/bash
###
 # @Date: 2020-09-23 10:50:50
 # @LastEditors: ECarry
 # @LastEditTime: 2020-09-27 09:58:50
 # @Description: 
### 

filepath=$(cd "$(dirname "$0")"; pwd)

###
 # @description: 配置网络脚本
 # @param {type} option_if
 # @return {type} 
###
function if_config(){
    nmcli device
    echo "---------------------------------------"
    echo -e "Example DEVICE \033[31m ens18 \033[0m."
    read -p "Select an interface (q to quit):" option_if
    [ $option_if == 'q' ] && $filepath/show_netools_menu.sh
    
    if ! nmcli connection show $option_if &> /dev/null
    then
      echo "$option_if - no such connection profile."
      sleep 1
      exit 10
    fi
    
    read -p "Please enter ip (exm:192.168.1.1/24): " IPADD
    read -p "Please enter gateway:" GATEWAY

    nmcli connection modify $option_if ipv4.addresses $IPADD ipv4.gateway $GATEWAY ipv4.method manual connection.autoconnect yes
    
    echo "IPADDR=$IPADD"  
    echo "GATEWAY=$GATEWAY"
    
    read -p "Restart network (y|n) ?" RES

    case $RES in
    y)
    systemctl restart network
    if [ $? -eq 0 ]
    then
      echo "Network restart successful."
      exit 0
    else
      echo "Network restart fault."
      exit 1
    fi
}

if_config
#!/bin/bash
###
 # @Date: 2020-09-23 10:50:50
 # @LastEditors: ECarry
 # @LastEditTime: 2020-09-23 23:12:31
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
    echo -e "Example DEVICE \033[31m ens18 \033[0m."
    read -p "Select an interface (q to quit):" option_if
    [ $option_if == 'q' ] && $filepath/show_netools_menu.sh
    nmcli connection show $option_if &> /dev/null
    
    #[ ! $? -eq 0 ] && echo "Error: $option_if - no such connection profile." #&& ./freenas_console_setup.sh
    
}

if_config
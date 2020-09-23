#!/bin/bash
###
 # @Date: 2020-09-23 10:49:25
 # @LastEditors: ECarry
 # @LastEditTime: 2020-09-23 10:51:19
 # @Description: 
### 


function Reboot(){
    while :
    do
      read -p "Confirm reboot (y/n): " option_reboot
      case $option_reboot in
        y) 
          echo "Reboot..."
          init 6
        ;;
        n) 
          echo "Cancel reboot"
          ./$0
        ;;
      esac
    done
}

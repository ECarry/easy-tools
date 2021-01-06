#!/bin/bash
###
 # @Date: 2021-01-06 10:19:59
 # @LastEditors: ECarry
 # @LastEditTime: 2021-01-06 10:20:09
 # @Description: 安装 zabbix
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

# info
echo "stop friewalld and selinux..."
sleep 2

# 关闭防火墙
systemctl stop firewalld && systemctl disable firewalld

# 临时关闭 SELINUX
setenforce 0

# 永久关闭 SELINUX，需要重启生效
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config

# 替换官方源为 阿里源
rpm -Uvh https://mirrors.aliyun.com/zabbix/zabbix/5.0/rhel/7/x86_64/zabbix-release-5.2-1.el7.noarch.rpm && sed -i 's@http://repo.zabbix.com@https://mirrors.aliyun.com/zabbix@' /etc/yum.repos.d/zabbix.repo
yum clean all

# 安装 zabbix server 和 agent
yum install zabbix-server-mysql zabbix-agent -y

#安装 Software Collections
yum install centos-release-scl -y
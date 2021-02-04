#!/bin/bash

# nginx日志裁切，裁切成日志以每日为单位存储

# 日志目录
LOG_PATH=/var/lib/docker/volumes/logs/_data

# 格式化昨天时间
YESTERDAY=`date -d "yesterday" +%Y%m%d`

mv ${LOG_PATH}/access.log ${LOG_PATH}/access_${YESTERDAY}.log

# 重启 docker nginx
docker restart blog

# 部署在主机里的 nginx，可以向主线程发送 USR1 信号，其作用是通常被用来告知应用程序重载配置文件。例如，向 Apache HTTP 服务器发送一个 USR1 信号将导致以下步骤的发生：停止接受新的连接，等待当前连接停止，重新载入配置文件，重新打开日志文件，重启服务器，从而实现相对平滑的不关机的更改。
# kill -USR1 `cat /var/run/nginx.pid`
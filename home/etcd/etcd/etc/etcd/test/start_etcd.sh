#!/bin/sh

# 开启自启动
systemctl enable etcd 

# 更新配置文件
systemctl daemon-reload

# 重启etcd
systemctl restart etcd

# 查看状态
systemctl status etcd
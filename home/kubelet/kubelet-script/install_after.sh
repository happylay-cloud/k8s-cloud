#!/usr/bin/env bash

# functions 脚本提供了公用的函数
source /etc/rc.d/init.d/functions

# 主机名为证书kubelet设置的节点名
hostnamectl set-hostname kubelet

# 导出镜像
# docker save happylay/pause:3.2 > ./pause.tar

# 导入镜像
docker load < /etc/kubelet/pause.tar

echo '*****************************注意****************************
1、User "system:node:kubelet" ->  "CN": "system:node:kubelet"
2、主机名称需要和kubelet名称相同
3、建议使用ip颁发证书及使用ip作为主机名
4、hostnamectl set-hostname kubelet'


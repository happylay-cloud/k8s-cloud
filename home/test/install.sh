#!/bin/sh

# 卸载老版本

yum remove -y kube-proxy

yum remove -y kubelet

yum remove -y kube-scheduler

yum remove -y kube-controller-manager

yum remove -y kube-apiserver

yum remove -y flanneld

yum remove -y etcd

yum remove -y docker

#----------------------------------------------------------安装新版本----------------------------------------------------------

# 基础安装环境
yum install -y docker-19.03.13-1.el7.x86_64.rpm

yum install -y etcd-3.4.13-1.el7.x86_64.rpm

yum install -y flanneld-0.13.0-1.el7.x86_64.rpm

# master节点
yum install -y kube-apiserver-1.18.10-1.el7.x86_64.rpm

yum install -y kube-controller-manager-1.18.10-1.el7.x86_64.rpm

yum install -y kube-scheduler-1.18.10-1.el7.x86_64.rpm

#------------------------------------------------------------------------------------------------------------------------------

# 启动etcd
systemctl enable etcd && systemctl daemon-reload && systemctl start etcd && systemctl restart etcd

# 启动flanneld
systemctl enable flanneld && systemctl daemon-reload && systemctl start flanneld && systemctl restart flanneld

# 初始化网络环境
/etc/flannel/init_config.sh

# 启动docker
systemctl enable docker && systemctl daemon-reload && systemctl start docker && systemctl restart docker

# 启动kube-apiserver
systemctl enable kube-apiserver && systemctl daemon-reload && systemctl start kube-apiserver && systemctl restart kube-apiserver

# 启动kube-controller-manager
systemctl enable kube-controller-manager && systemctl daemon-reload && systemctl start kube-controller-manager && systemctl restart kube-controller-manager

# 启动kube-scheduler
systemctl enable kube-scheduler && systemctl daemon-reload && systemctl start kube-scheduler && systemctl restart kube-scheduler

#------------------------------------------------------安装node节点（建议最后安装）------------------------------------------------------

# node节点
yum install -y kubelet-1.18.10-1.el7.x86_64.rpm

yum install -y kube-proxy-1.18.10-1.el7.x86_64.rpm

# 启动kubelet
systemctl enable kubelet && systemctl daemon-reload && systemctl start kubelet && systemctl restart kubelet

# 启动kube-proxy
systemctl enable kube-proxy && systemctl daemon-reload && systemctl start kube-proxy && systemctl restart kube-proxy








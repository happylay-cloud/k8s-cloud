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
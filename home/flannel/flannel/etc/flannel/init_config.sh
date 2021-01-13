#!/bin/sh

# 预定义子网网段
ETCDCTL_API=2 etcdctl \
  --endpoints="https://127.0.0.1:2379" \
  --ca-file="/etc/flannel/ssl/etcd-ca.pem" \
  --cert-file="/etc/flannel/ssl/etcd.pem" \
  --key-file="/etc/flannel/ssl/etcd-key.pem" \
set /flannel/network/config '{"Network":"10.233.0.0/16","SubnetLen":25,"Backend":{"Type":"vxlan","VNI":1}}'

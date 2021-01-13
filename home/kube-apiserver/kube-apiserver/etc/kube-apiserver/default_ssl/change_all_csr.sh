#!/bin/sh

# 生成客户端请求证书
./get_admin.sh
./get_etcd.sh
./get_kube_apiserver.sh
./get_kube_controller.sh
./get_kubelet.sh
./get_kube_proxy.sh
./get_kube_scheduler.sh
./get_service_account.sh
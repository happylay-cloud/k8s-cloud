#!/bin/sh

# 创建admin的kubeconfig

# 设置集群参数
kubectl config set-cluster kubernetes \
  --certificate-authority=../default_ssl/k8s-ca/k8s-ca.pem \
  --embed-certs=true \
  --server=https://127.0.0.1:6443 \
  --kubeconfig=./admin.kubeconfig

# 设置客户端认证参数
kubectl config set-credentials admin \
  --client-certificate=../default_ssl/admin/admin.pem \
  --client-key=../default_ssl/admin/admin-key.pem \
  --embed-certs=true \
  --kubeconfig=./admin.kubeconfig

# 设置上下文参数
kubectl config set-context default \
  --cluster=kubernetes \
  --user=admin \
  --kubeconfig=./admin.kubeconfig

# 设置默认上下文
kubectl config use-context default --kubeconfig=./admin.kubeconfig
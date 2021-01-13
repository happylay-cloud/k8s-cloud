#!/bin/sh

# 创建kubelet的kubeconfig

# 设置集群参数
kubectl config set-cluster kubernetes \
  --certificate-authority=../default_ssl/k8s-ca/k8s-ca.pem \
  --embed-certs=true \
  --server=https://127.0.0.1:6443 \
  --kubeconfig=./kubelet.kubeconfig

# 设置客户端认证参数（kubelet为默认主机名）
kubectl config set-credentials system:node:kubelet \
  --client-certificate=../default_ssl/kubelet/kubelet.pem \
  --client-key=../default_ssl/kubelet/kubelet-key.pem \
  --embed-certs=true \
  --kubeconfig=./kubelet.kubeconfig

# 设置上下文参数
kubectl config set-context default \
  --cluster=kubernetes \
  --user=system:node:kubelet \
  --kubeconfig=./kubelet.kubeconfig

# 设置默认上下文
kubectl config use-context default --kubeconfig=./kubelet.kubeconfig



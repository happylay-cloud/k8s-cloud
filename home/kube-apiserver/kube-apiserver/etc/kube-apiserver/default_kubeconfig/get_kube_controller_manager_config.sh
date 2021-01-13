#!/bin/sh

# 创建kube-controller-manager的kubeconfig

# 设置集群参数
kubectl config set-cluster kubernetes \
  --certificate-authority=../default_ssl/k8s-ca/k8s-ca.pem \
  --embed-certs=true \
  --server=https://127.0.0.1:6443 \
  --kubeconfig=./kube-controller.kubeconfig

# 设置客户端认证参数
kubectl config set-credentials system:kube-controller-manager \
  --client-certificate=../default_ssl/kube-controller/kube-controller.pem \
  --client-key=../default_ssl/kube-controller/kube-controller-key.pem \
  --embed-certs=true \
  --kubeconfig=./kube-controller.kubeconfig

# 设置上下文参数
kubectl config set-context default \
  --cluster=kubernetes \
  --user=system:kube-controller-manager \
  --kubeconfig=./kube-controller.kubeconfig

# 设置默认上下文
kubectl config use-context default --kubeconfig=./kube-controller.kubeconfig


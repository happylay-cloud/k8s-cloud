#!/bin/sh

# 产生kube-proxy工作节点证书
cfssl gencert \
  -ca=./k8s-ca/k8s-ca.pem \
  -ca-key=./k8s-ca/k8s-ca-key.pem \
  -config=./k8s-ca-config.json \
  -profile=kubernetes \
  ./kube-proxy-csr.json | cfssljson -bare ./kube-proxy/kube-proxy
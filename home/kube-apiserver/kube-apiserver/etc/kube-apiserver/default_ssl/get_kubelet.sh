#!/bin/sh

# 产生kubelet工作节点证书
cfssl gencert \
  -ca=./k8s-ca/k8s-ca.pem \
  -ca-key=./k8s-ca/k8s-ca-key.pem \
  -config=./k8s-ca-config.json \
  -profile=kubernetes \
  ./kubelet-csr.json | cfssljson -bare ./kubelet/kubelet
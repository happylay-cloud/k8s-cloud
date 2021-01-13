#!/bin/sh

# 产生kube-controller-manager工作节点证书
cfssl gencert \
  -ca=./k8s-ca/k8s-ca.pem \
  -ca-key=./k8s-ca/k8s-ca-key.pem \
  -config=./k8s-ca-config.json \
  -profile=kubernetes \
  ./kube-controller-csr.json | cfssljson -bare ./kube-controller/kube-controller
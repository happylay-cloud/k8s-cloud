#!/bin/sh

# 产生kube-apiserver证书
cfssl gencert \
  -ca=./k8s-ca/k8s-ca.pem \
  -ca-key=./k8s-ca/k8s-ca-key.pem \
  -config=./k8s-ca-config.json \
  -profile=kubernetes \
  ./kube-apiserver-csr.json | cfssljson -bare ./kube-apiserver/kube-apiserver
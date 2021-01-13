#!/bin/sh

# 产生admin用户证书
cfssl gencert \
  -ca=./k8s-ca/k8s-ca.pem \
  -ca-key=./k8s-ca/k8s-ca-key.pem \
  -config=./k8s-ca-config.json \
  -profile=kubernetes \
  admin-csr.json | cfssljson -bare ./admin/admin

  
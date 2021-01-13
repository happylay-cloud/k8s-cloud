#!/bin/sh

# 产生服务帐户签发证书
cfssl gencert \
  -ca=./k8s-ca/k8s-ca.pem \
  -ca-key=./k8s-ca/k8s-ca-key.pem \
  -config=./k8s-ca-config.json \
  -profile=kubernetes \
  ./service-account-csr.json | cfssljson -bare ./service-account/service-account
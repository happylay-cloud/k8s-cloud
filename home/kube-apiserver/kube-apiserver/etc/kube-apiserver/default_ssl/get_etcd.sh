#!/bin/sh

# 产生etcd证书
cfssl gencert \
  -ca=./etcd-ca/etcd-ca.pem \
  -ca-key=./etcd-ca/etcd-ca-key.pem \
  -config=./etcd-ca-config.json \
  -profile=etcd \
  ./etcd-server-csr.json | cfssljson -bare ./etcd/etcd
#!/bin/sh

# 生成默认CA证书
cfssl gencert -initca etcd-ca-csr.json | cfssljson -bare ./etcd-ca/etcd-ca 

# 生成默认客户端证书
cfssl gencert \
  -ca=./etcd-ca/etcd-ca.pem \
  -ca-key=./etcd-ca/etcd-ca-key.pem \
  -config=./etcd-ca-config.json \
  -profile=etcd \
  ./etcd-server-csr.json | cfssljson -bare ./etcd/etcd
  
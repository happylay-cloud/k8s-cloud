#!/bin/sh

# 产生etcd-ca证书
cfssl gencert -initca etcd-ca-csr.json | cfssljson -bare ./etcd-ca/etcd-ca  
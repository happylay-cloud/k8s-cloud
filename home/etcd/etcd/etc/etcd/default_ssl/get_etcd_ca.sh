#!/bin/sh

# 生成默认CA证书
cfssl gencert -initca etcd-ca-csr.json | cfssljson -bare ./etcd-ca/etcd-ca 

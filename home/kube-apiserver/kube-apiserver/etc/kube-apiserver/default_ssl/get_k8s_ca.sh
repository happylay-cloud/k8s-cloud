#!/bin/sh

# 产生k8s-ca证书
cfssl gencert -initca k8s-ca-csr.json | cfssljson -bare ./k8s-ca/k8s-ca
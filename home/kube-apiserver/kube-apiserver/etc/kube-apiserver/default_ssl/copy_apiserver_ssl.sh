#!/bin/sh

# k8s证书
cp ./k8s-ca/k8s-ca.pem ../ssl
cp ./kube-apiserver/*.pem ../ssl
cp ./service-account/service-account.pem ../ssl

# etcd证书
cp ./etcd-ca/etcd-ca.pem ../ssl
cp ./etcd/*.pem ../ssl


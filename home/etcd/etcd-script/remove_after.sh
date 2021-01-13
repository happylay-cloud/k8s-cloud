#!/usr/bin/env bash
source /etc/rc.d/init.d/functions

/usr/bin/rm -rf \
/usr/lib/systemd/system/etcd.service \
/etc/etcd \
/usr/local/bin/etcd \
/usr/local/bin/etcdctl \
/usr/local/bin/cfssl \
/usr/local/bin/cfssl-certinfo \
/usr/local/bin/cfssljson
#!/usr/bin/env bash
source /etc/rc.d/init.d/functions

/usr/bin/rm -rf \
/usr/lib/systemd/system/kube-apiserver.service \
/etc/kube-apiserver \
/usr/local/bin/kube-apiserver \
/usr/local/bin/kubectl


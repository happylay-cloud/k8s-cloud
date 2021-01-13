#!/usr/bin/env bash
source /etc/rc.d/init.d/functions

/usr/bin/rm -rf \
/usr/lib/systemd/system/kube-proxy.service \
/etc/kube-proxy \
/usr/local/bin/kube-proxy


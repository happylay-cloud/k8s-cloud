#!/usr/bin/env bash
source /etc/rc.d/init.d/functions

/usr/bin/rm -rf \
/usr/lib/systemd/system/kube-controller-manager.service \
/etc/kube-controller-manager \
/usr/local/bin/kube-controller-manager


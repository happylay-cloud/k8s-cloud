#!/usr/bin/env bash
source /etc/rc.d/init.d/functions

/usr/bin/rm -rf \
/usr/lib/systemd/system/kubelet.service \
/etc/kubelet \
/usr/local/bin/kubelet \
/var/lib/kubelet


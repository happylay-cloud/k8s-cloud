#!/usr/bin/env bash
source /etc/rc.d/init.d/functions

/usr/bin/rm -rf \
/usr/lib/systemd/system/docker.service \
/usr/lib/systemd/system/containerd.service \
/etc/docker \
/usr/bin/containerd \
/usr/bin/containerd-shim \
/usr/bin/ctr \
/usr/bin/docker \
/usr/bin/dockerd \
/usr/bin/docker-init \
/usr/bin/docker-proxy \
/usr/bin/runc \
/usr/local/bin/docker-compose \
/var/lib/docker \
/var/run/docker \
/var/run/docker.pid \
/var/run/docker.sock 


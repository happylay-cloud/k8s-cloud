#!/usr/bin/env bash
source /etc/rc.d/init.d/functions

/usr/bin/rm -rf \
/usr/lib/systemd/system/flanneld.service \
/etc/flannel \
/usr/local/bin/flanneld \
/usr/local/bin/mk-docker-opts.sh \
/run/flannel

# 卸载flannel网络
ifconfig flannel.1 down >/dev/null 2>&1
ip link delete flannel.1 >/dev/null 2>&1

# 还原docker,service文件
tee /usr/lib/systemd/system/docker.service<<-'EOF'
[Unit]
Description=Docker Application Container Engine 
Documentation=https://docs.docker.com 
After=network-online.target firewalld.service 
Wants=network-online.target

[Service]
Type=notify 

# 默认情况下不对cgroup使用systemd，因为委托问题仍然存在，并且systemd当前不支持docker运行的容器所需的cgroup功能集
ExecStart=/usr/bin/dockerd
ExecReload=/bin/kill -s HUP $MAINPID
TimeoutSec=0
RestartSec=2
Restart=always

# 请注意，在Systemd 229中，StartLimit* 选项已从“服务”移至“单元”。
# systemd 229及更高版本都接受旧位置和新位置，因此请使用旧位置使它们适用于任何版本的systemd。
StartLimitBurst=3

# 请注意，在systemd 230中，StartLimitInterval被重命名为StartLimitIntervalSec。
# systemd 230及更高版本均接受旧名称和新名称，因此使用旧名称可使此选项适用于任何版本的systemd。
StartLimitInterval=60s

# 由于内核中的记帐开销，具有非零的Limit*s会导致性能问题。我们建议使用cgroups进行容器本地记帐。
LimitNOFILE=infinity
LimitNPROC=infinity
LimitCORE=infinity

# 如果您的systemd版本不支持，请评论TasksMax。
# 仅systemd 226及更高版本支持此选项。
TasksMax=infinity

# 将委托设置为是，以便systemd不会重置docker容器的cgroup
Delegate=yes

# 仅杀死docker进程，而不杀死cgroup中的所有进程
KillMode=process

[Install] 
WantedBy=multi-user.target

EOF

# 重启docker
systemctl daemon-reload && systemctl restart docker


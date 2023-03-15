#!/usr/bin/env bash


apt-get update && apt-get install chrony bash-completion wget -y

cat << EOF >/etc/chrony/chrony.conf
server time.cloud.tencent.com iburst
server time4.cloud.tencent.com iburst
server time5.cloud.tencent.com iburst
server ntp.aliyun.com iburst
server ntp6.aliyun.com iburst
server ntp7.aliyun.com iburst

# 记录系统时钟的漂移
driftfile /var/lib/chrony/chrony.drift
# 日志文件保存的目录
logdir /var/log/chrony
# 允许的最大时间偏差
maxupdateskew 100.0
# 启用硬件时钟同步
rtcsync
# 允许系统时间瞬间跳跃的最大步长 1秒3次
makestep 1 3
# 使用 UTC 作为本地时间的基准
leapsectz right/UTC
EOF

systemctl enable chrony
systemctl restart chrony
#systemctl status chrony

echo "alias tt='date \"+%Y-%m-%d %H:%M:%S\"'" >> ~/.bashrc
source ~/.bashrc

dpkg-reconfigure tzdata
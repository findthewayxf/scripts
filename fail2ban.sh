#!/bin/bash

apt update

# 安装 Fail2ban 包
apt install fail2ban -y

sleep 3

# 配置 Fail2ban
echo "正在配置 Fail2ban..."
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.conf.bak  # 复制默认配置文件 jail.conf 到 jail.local
rm -rf /etc/fail2ban/jail.d/*  # 删除 jail.d 目录下的所有文件

# 创建 sshd.local 文件并写入 SSH 防御规则
cat << EOF > /etc/fail2ban/jail.d/sshd.local
[sshd]
enabled = true
port = 22122
mode = normal
backend = systemd
maxretry = 2
findtime = 1d
bantime = 3d
EOF

# 启用并重启 Fail2ban
systemctl enable fail2ban  # 设置 Fail2ban 开机自启
systemctl restart fail2ban  # 重启 Fail2ban 服务

sleep 5

# 显示版本
echo "Fail2ban 版本："
fail2ban-client --version  # 显示 Fail2ban sshd jail 的状态

sleep 3

# 显示状态
echo "Fail2ban 状态："
fail2ban-client status sshd  # 显示 Fail2ban sshd jail 的状态

sleep 5

echo "Iptables 规则："
iptables -L -n  # 显示当前的 iptables 规则


sleep 5
echo "Fail2ban 安装和配置完成。"

#!/bin/bash

# 备份原始文件
cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp /etc/apt/sources.list.d/pve-enterprise.list /etc/apt/sources.list.d/pve-enterprise.list.bak
cp /etc/apt/sources.list.d/ceph.list /etc/apt/sources.list.d/ceph.list.bak

# 修改 /etc/apt/sources.list
cat << EOF > /etc/apt/sources.list
deb http://mirrors4.tuna.tsinghua.edu.cn/debian/ bookworm main contrib non-free non-free-firmware
deb http://mirrors4.tuna.tsinghua.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware
deb http://mirrors4.tuna.tsinghua.edu.cn/debian/ bookworm-backports main contrib non-free non-free-firmware
deb http://mirrors4.tuna.tsinghua.edu.cn/debian-security bookworm-security main contrib non-free non-free-firmware
EOF

# 修改 /etc/apt/sources.list.d/pve-enterprise.list
cat << EOF > /etc/apt/sources.list.d/pve-enterprise.list
deb http://mirrors4.tuna.tsinghua.edu.cn/proxmox/debian/pve bookworm pve-no-subscription
EOF

# 修改 /etc/apt/sources.list.d/ceph.list
cat << EOF > /etc/apt/sources.list.d/ceph.list
deb https://mirrors.ustc.edu.cn/proxmox/debian/ceph-quincy bookworm no-subscription
EOF

# 更新软件包列表
apt update

echo "PVE 源已更新!"

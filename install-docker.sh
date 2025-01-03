#!/bin/bash

# https://docs.docker.com/engine/install/debian/

# 判断当前用户是否为 root 用户
if [ "$(id -u)" -ne 0 ]; then
  echo "请使用 root 用户执行此脚本" >&2
  exit 1
fi

# 判断当前系统是否为 Debian 系统
if [ ! -f "/etc/debian_version" ]; then
  echo "此脚本只适用于 Debian 系统" >&2
  exit 1
fi

# 安装必要的依赖
apt-get update
apt-get install ca-certificates curl -y


# 添加 Docker 的 GPG 密钥
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# 添加 Docker 的 APT 源
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

# 更新 APT 缓存并安装 Docker
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# 检查 Docker 是否正常运行
if ! systemctl status docker > /dev/null 2>&1; then
  echo "Docker 安装成功，但未能正常运行，请检查 Docker 是否配置正确" >&2
fi

echo "Docker 安装成功"
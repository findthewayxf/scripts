#!/usr/bin/env bash

# 下载 tcping-linux-amd64-v0.1.1.tar.gz 文件
if [ ! -f tcping-linux-amd64-v0.1.1.tar.gz ]; then
  wget https://github.com/cloverstd/tcping/releases/download/v0.1.1/tcping-linux-amd64-v0.1.1.tar.gz
fi

# 解压到 /usr/local/tcping 目录下
mkdir -p /usr/local/tcping
tar -zxvf tcping-linux-amd64-v0.1.1.tar.gz -C /usr/local/tcping --strip-components=1

# 将 /usr/local/tcping 加入 PATH 环境变量
if [ -z "$(grep 'export PATH=\$PATH:/usr/local/tcping' ~/.bashrc)" ]; then
  echo 'export PATH=$PATH:/usr/local/tcping' >> ~/.bashrc
  source ~/.bashrc
fi

# 删除 tcping-linux-amd64-v0.1.1.tar.gz 文件
rm -f tcping-linux-amd64-v0.1.1.tar.gz

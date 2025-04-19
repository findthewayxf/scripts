#!/usr/bin/env bash

# 检查/usr/local/tcping目录是否存在，如果不存在则创建
if [ ! -d "/usr/local/tcping" ]; then
    mkdir -p /usr/local/tcping
fi

# 检查是否已经下载过文件
if [ ! -f "/usr/local/tcping/tcping" ]; then
    # 下载文件到/tmp
    if ! curl -fsSL -o /tmp/tcping-linux-amd64-v0.1.1.tar.gz https://raw.xffx.in/github.com/cloverstd/tcping/releases/download/v0.1.1/tcping-linux-amd64-v0.1.1.tar.gz; then
        echo "Failed to download tcping package." >&2
        exit 1
    fi

    # 解压文件到/usr/local/tcping
    tar -zxvf /tmp/tcping-linux-amd64-v0.1.1.tar.gz -C /usr/local/tcping

    # 删除下载的文件
    rm /tmp/tcping-linux-amd64-v0.1.1.tar.gz
fi

ln -s /usr/local/tcping/tcping /usr/local/bin/tcping

echo "tcping installed successfully!"



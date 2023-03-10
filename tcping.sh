#!/usr/bin/env bash

# 检查/usr/local/tcping目录是否存在，如果不存在则创建
if [ ! -d "/usr/local/tcping" ]; then
    mkdir -p /usr/local/tcping
fi

# 检查是否已经下载过文件
if [ ! -f "/usr/local/tcping/tcping" ]; then
    # 下载文件到/tmp
    if ! curl -fsSL -o /tmp/tcping-linux-amd64-v0.1.1.tar.gz https://github.com/cloverstd/tcping/releases/download/v0.1.1/tcping-linux-amd64-v0.1.1.tar.gz; then
        echo "Failed to download tcping package." >&2
        exit 1
    fi

    # 解压文件到/usr/local/tcping
    tar -zxvf /tmp/tcping-linux-amd64-v0.1.1.tar.gz -C /usr/local/tcping

    # 删除下载的文件
    rm /tmp/tcping-linux-amd64-v0.1.1.tar.gz
fi

# 检查~/.bashrc是否已经包含export PATH=$PATH:/usr/local/tcping，如果没有则追加
if ! grep -qxF 'export PATH=$PATH:/usr/local/tcping' ~/.bashrc ; then
    echo 'export PATH=$PATH:/usr/local/tcping' >> ~/.bashrc
fi

# 立即生效
export PATH=$PATH:/usr/local/tcping

echo "tcping installed successfully!"

echo $PATH
source ~/.bashrc

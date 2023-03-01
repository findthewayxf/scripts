#!/usr/bin/env bash

# 检查是否已经下载过文件
if [ ! -f "tcping-linux-amd64-v0.1.1.tar.gz" ]; then
    wget https://github.com/cloverstd/tcping/releases/download/v0.1.1/tcping-linux-amd64-v0.1.1.tar.gz
fi

# 解压文件到/usr/local/tcping
tar -zxvf tcping-linux-amd64-v0.1.1.tar.gz -C /usr/local/tcping

# 检查~/.bashrc是否已经包含export PATH=$PATH:/usr/local/tcping，如果没有则追加
if ! grep -qxF 'export PATH=$PATH:/usr/local/tcping' ~/.bashrc ; then
    echo 'export PATH=$PATH:/usr/local/tcping' >> ~/.bashrc
fi

# 立即生效
source ~/.bashrc

# 删除下载的文件
rm -f tcping-linux-amd64-v0.1.1.tar.gz

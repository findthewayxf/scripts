#!/usr/bin/env bash

# 删除/usr/local/tcping目录
if [ -d "/usr/local/tcping" ]; then
    rm -rf /usr/local/tcping
fi

# 从~/.bashrc中删除export PATH=$PATH:/usr/local/tcping
sed -i '/export PATH=$PATH:\/usr\/local\/tcping/d' ~/.bashrc

# 立即生效
source ~/.bashrc

echo "tcping uninstalled successfully!"

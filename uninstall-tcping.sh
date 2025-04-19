#!/usr/bin/env bash

# 删除/usr/local/tcping目录
if [ -d "/usr/local/tcping" ]; then
    rm -rf /usr/local/tcping
fi

bash unlink /usr/local/bin/tcping

echo "tcping uninstalled successfully!"

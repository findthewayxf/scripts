#!/bin/bash

# 安装 curl
apt-get update
apt-get install sudo curl -y

# 检查是否已安装 speedtest-cli
if ! command -v speedtest &> /dev/null; then
    echo "正在安装 speedtest-cli..."
	curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
    apt-get install speedtest-cli -y
fi


# 检查 speedtest-cli 是否成功安装
if ! command -v speedtest &> /dev/null; then
    echo "speedtest-cli 安装失败，请检查网络连接和软件源设置。"
    exit 1
fi

# 声明一个空数组来存储结果
results=()

# 运行第一条命令并将结果添加到数组
output=$(speedtest -s 54312 --accept-license)
results+=("$output")

# 运行第二条命令并将结果添加到数组
output=$(speedtest -s 59386 --accept-license)
results+=("$output")

# 显示所有结果
for result in "${results[@]}"; do
  echo "$result"
done

exit 0


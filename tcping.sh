#!/usr/bin/env bash

mkdir -p /usr/local/tcping
wget https://github.com/cloverstd/tcping/releases/download/v0.1.1/tcping-linux-amd64-v0.1.1.tar.gz
if [ $? -eq 0 ]; then
    tar -zxvf tcping-linux-amd64-v0.1.1.tar.gz -C /usr/local/tcping
    echo 'export PATH=$PATH:/usr/local/tcping' >> ~/.bashrc
    source ~/.bashrc
fi
rm -f tcping*

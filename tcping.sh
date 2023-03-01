#!/usr/bin/env bash

mkdir -p /usr/local/tcping
wget https://github.com/cloverstd/tcping/releases/download/v0.1.1/tcping-linux-amd64-v0.1.1.tar.gz
if [ -f tcping-linux-amd64-v0.1.1.tar.gz ]; then
  echo "Download succeeded"
else
  echo "Download failed"
  exit 1
fi
tar -zxvf tcping-linux-amd64-v0.1.1.tar.gz -C /usr/local/tcping
if [ -f /usr/local/tcping/tcping ]; then
  echo "Extract succeeded"
else
  echo "Extract failed"
  exit 1
fi
echo 'export PATH=$PATH:/usr/local/tcping' >> ~/.bashrc
source ~/.bashrc
rm -f tcping*

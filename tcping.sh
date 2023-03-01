#!/usr/bin/env bash

set -euo pipefail

mkdir -p /usr/local/tcping

wget -q https://github.com/cloverstd/tcping/releases/download/v0.1.1/tcping-linux-amd64-v0.1.1.tar.gz -O /tmp/tcping.tar.gz
tar -zxf /tmp/tcping.tar.gz -C /usr/local/tcping --strip-components 1
rm -f /tmp/tcping.tar.gz

echo 'export PATH="$PATH:/usr/local/tcping"' >> ~/.bashrc
source ~/.bashrc

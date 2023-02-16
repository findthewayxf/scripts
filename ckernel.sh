#!/bin/bash


dpkg --list | grep linux-image | awk '{print $2}' | grep -Fv $(uname -r) | while read line; do
apt autoremove --purge  -y $line
done

dpkg --list | grep linux-headers | awk '{print $2}' | grep -Fv $(uname -r) | while read line; do
apt autoremove --purge  -y $line
done

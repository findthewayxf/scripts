# Linux scripts



## ssh

```bash
bash <(curl -fsSL raw.githubusercontent.com/findthewayxf/scripts/main/ssh.sh) -og findthewayxf -p 22122 -d
```



## 内核清理

```bash
bash <(curl -fsSL raw.githubusercontent.com/findthewayxf/scripts/main/ckernel.sh) 
```



## chrony

### 国内

```bash
bash <(curl -fsSL raw.githubusercontent.com/findthewayxf/scripts/main/chrony-in.sh)
```

### 国外

```bash
bash <(curl -fsSL raw.githubusercontent.com/findthewayxf/scripts/main/chrony-out.sh)
```



## nginx

```bash
bash <(curl -fsSL raw.githubusercontent.com/findthewayxf/scripts/main/install-nginx.sh)
```



## tcping

```bash
bash <(curl -fsSL raw.githubusercontent.com/findthewayxf/scripts/main/tcping.sh) 
```

```bash
bash <(curl -fsSL raw.githubusercontent.com/findthewayxf/scripts/main/uninstall-tcping.sh) 
```



## docker

```bash
bash <(curl -fsSL raw.githubusercontent.com/findthewayxf/scripts/main/install-docker.sh) 
```



```bash
bash <(curl -fsSL raw.githubusercontent.com/findthewayxf/scripts/main/install-docker-in.sh) 
```



## speedtest

```bash
bash <(curl -fsSL raw.githubusercontent.com/findthewayxf/scripts/main/speedtest.sh) 
```



## memorycheck

```bash
bash <(curl -fsSL raw.githubusercontent.com/findthewayxf/scripts/main/memoryCheck.sh) 
```

```shell
echo "blacklist virtio_balloon" | tee /etc/modprobe.d/blacklist.conf && update-initramfs -u
```


# Linux scripts



```shell
-f (fail silently): 静默模式，不输出错误和进度信息。
-s (silent): 静默模式，不输出进度条和错误信息。
-S (show error): 与 -s 结合使用，在发生错误时显示错误信息。
-L (location): 跟随重定向，如果服务器报告资源已被移动到其他位置，则自动访问新的位置。
```



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



## pve_change_source

```shell
bash <(curl -fsSL raw.xffx.in/raw.githubusercontent.com/findthewayxf/scripts/main/pve_change_source.sh)
```


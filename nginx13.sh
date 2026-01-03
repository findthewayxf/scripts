#!/bin/bash

apt update
apt install -y unzip wget curl git dnsutils sqlite3 libjemalloc-dev apt-transport-https zstd google-perftools libmimalloc3

mkdir -p "/opt/cache"
mkdir -p "/var/www/html"
mkdir -p "/var/www/ssl"
mkdir -p "/etc/nginx"
mkdir -p "/etc/nginx/conf.d"
mkdir -p "/var/log/nginx"
mkdir -p "/var/cache/nginx/client_temp"
mkdir -p "/var/cache/nginx/proxy_temp"
mkdir -p "/var/cache/nginx/fastcgi_temp"
mkdir -p "/var/cache/nginx/scgi_temp"
mkdir -p "/var/cache/nginx/uwsgi_temp"

cd /tmp
wget http://222.186.41.48:22250/nginx/nginx_debian13
mv -f /tmp/nginx_debian13 /usr/sbin/nginx && chmod +x /usr/sbin/nginx

wget http://222.186.41.48:22250/nginx/nginxConf.zip
mv -f /tmp/nginxConf.zip /opt/cache/nginxConf.zip

unzip /opt/cache/nginxConf.zip -d /etc/nginx >/dev/null
rm -rf /tmp/nginxConf

cat << EOF >/etc/systemd/system/nginx.service
[Unit]
Description=NGINX
After=network.target

[Service]
Type=forking
PIDFile=/run/nginx.pid
ExecStart=/usr/sbin/nginx -c /etc/nginx/nginx.conf
ExecReload=/usr/sbin/nginx -s reload
ExecStop=/bin/kill -s QUIT \$MAINPID
KillMode=process
Restart=always
RestartSec=2
TimeoutStopSec=5
Nice=-9

[Install]
WantedBy=multi-user.target
EOF

mkdir -p "/etc/systemd/system/nginx.service.d"
printf "[Service]\nExecStartPost=/bin/sleep 0.1\n" >/etc/systemd/system/nginx.service.d/override.conf

systemctl daemon-reload
systemctl enable nginx
systemctl restart nginx
systemctl status nginx

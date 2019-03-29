#!/bin/bash
cd /usr/src
tar -xf nginx-1.12.2.tar.gz
cd nginx-1.12.2
id nginx || useradd -r -s/sbin/nologin nginx 
./configure  --prefix=/usr/local/nginx \
--user=nginx \
--group=nginx \
--with-http_stub_status_module \
--with-http_ssl_module \
--with-stream
make && make install
ln -sf /usr/local/nginx/sbin/nginx /usr/bin/nginx
/usr/bin/nginx 



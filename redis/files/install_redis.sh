#!/bin/bash
 

install_redis(){
scp redis-4.0.8.tar.gz  $1:/usr/src 
tar -zxf /usr/src/redis-4.0.8.tar.gz  
cd redis-4.0.8
make
make install
}


install_pkg() {
    rpm -q gcc || yum -y install gcc 
    rpm -q tcl || yum -y install tcl
    rpm -q expect || yum -y install expect 
}


init_redis() {
   expect << EOF
   spawn ./utils/install_server.sh
   expect "]"   {send "\r"}
   expect "]"   {send "\r"}
   expect "]"   {send "\r"}
   expect "]"   {send "\r"}
   expect "]"   {send "\r"}
   expect "]"   {send "\r"}
   expect "]"   {send "\r"}
   expect "."   {send "\r"}
   expect "#"   {send "exit\r"}
EOF
}


install_pkg
install_redis
init_redis
/etc/init.d/redis_6379 start 

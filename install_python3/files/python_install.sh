#!/bin/bash

yum -y groupinstall "Development tools"
yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-deve  xz-devel
cd /usr/local/src
mkdir /usr/local/python3
tar xf Python-3.6.1rc1.tar.xz
cd Python-3.6.1rc1
./configure --prefix=/usr/local/python3
make && make install
ln -s /usr/local/python3/bin/python3 /usr/bin/python3
ln -s /usr/local/python3/bin/pip3 /usr/bin/pip3

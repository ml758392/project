#!/bin/bash
yum -y install gcc gcc-c++ cmake ncurses-devel perl &>/dev/null
id mysql &>/dev/null
if [ $? -ne 0 ];then
    useradd -s /sbin/nologin mysql
fi

cd /usr/src
if [ -f mysql-5.6.43.tar.gz  ];then
    tar -xf mysql-5.6.43.tar.gz

    cd mysql-5.6.43
    cmake .
    make
    make install
    /usr/local/mysql/scripts/mysql_install_db --user=mysql --datadir=/usr/local/mysql/data/ --basedir=/usr/local/mysql/
    
    chown -R root.mysql /usr/local/mysql
    chown -R mysql /usr/local/mysql/data
    
    /bin/cp -f /usr/local/mysql/support-files/mysql.server /etc/init.d/mysqld
    chmod +x /etc/init.d/mysqld
    /bin/cp -f /usr/local/mysql/support-files/my-default.cnf /etc/my.cnf
    
    echo "/usr/local/mysql/lib/" >> /etc/ld.so.conf
    ldconfig
    
    echo 'PATH=\$PATH:/usr/local/mysql/bin/' >> /etc/profile
    export PATH
    service mysqld start 
fi 

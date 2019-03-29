yum -y install expect &> /dev/null

expect << EOF
spawn   bash /usr/src/mysql-5.6.43/scripts/mysql_secure_installation.sh 
expect ":"   {send "\r"}
expect "]"   {send "y\r"}
expect "]"   {send "{{passwd}}\r"}
expect "]"   {send "{{passwd}}\r"}
expect "]"   {send "y\r"}
expect "]"   {send "y\r"}
expect "]"   {send "y\r"}
expect "]"   {send "y\r"}
expect "#"   {send "exit\r"}
EOF


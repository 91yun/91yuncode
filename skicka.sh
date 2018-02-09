#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

#安装git
apt-get >/dev/null 2>&1
[ $? -le '1' ] && ( apt-get update | apt-get -y install git )
yum >/dev/null 2>&1
[ $? -le '1' ] && yum -y install git

#安装go的环境依赖
wget https://dl.google.com/go/go1.9.4.linux-amd64.tar.gz
tar xzf go1.9.4.linux-amd64.tar.gz -C /usr/local
echo "export PATH=$PATH:/usr/local/go/bin" >> "/etc/profile"
source /etc/profile

#安装skicka
go get github.com/google/skicka
mv go/bin/skicka /usr/bin/
skicka init
skicka -no-browser-auth ls

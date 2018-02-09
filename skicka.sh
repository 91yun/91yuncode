#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
export PATH

yum install -y git
wget https://dl.google.com/go/go1.9.4.linux-amd64.tar.gz
tar xzf go1.9.4.linux-amd64.tar.gz -C /usr/local
echo "export PATH=$PATH:/usr/local/go/bin" >> "/etc/profile"
source /etc/profile

go get github.com/google/skicka
mv go/bin/skicka /usr/bin/
skicka init
skicka -no-browser-auth ls

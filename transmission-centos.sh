Centosver=`rpm -q centos-release|cut -d- -f3`
yum install -y epel-release curl
yum install -y transmission transmission-daemon
service transmission-daemon start
service transmission-daemon stop
if [ "$Centosver" == "6" ]; then
	sed -i 's/"rpc-whitelist-enabled": true/"rpc-whitelist-enabled": false/g' /var/lib/transmission/.config/transmission/settings.json
	service iptables stop
	chkconfig iptables off
fi

if [ "$Centosver" == "7" ]; then
	sed -i 's/"rpc-whitelist-enabled": true/"rpc-whitelist-enabled": false/g' /var/lib/transmission/.config/transmission-daemon/settings.json
	systemctl stop firewalld.service
	systemctl disable firewalld.service
fi
service transmission-daemon start
echo "安装完成"
currentip=`ip route get 8.8.4.4|grep -oP 'src \K\S+'`
echo "transmission访问地址: http://${currentip}:9091"
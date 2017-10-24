#!/bin/bash
room=$1
pc=$2

sudo apt install puppet -y
sudo echo "bucss-dev-$room-$pc" > /etc/hostname

if [ -n "$(grep puppet /etc/hosts)" ]
then
	sudo sed -i "/puppet/d" /etc/hosts
fi

sudo -- sh -c -e "echo '192.168.$room.42	bucss-dev-$room-master.pg12.local' >> /etc/hosts";
sudo echo -e "[main]\nssldir = /var/lib/puppet/ssl\nserver = bucss-dev-$room-master.pg12.local\n\n[master]\nvardir = /var/lib/puppet\ncadir = /var/lib/puppet/ssl/ca\ndns_alt_names = puppet" > /etc/puppet/puppet.conf

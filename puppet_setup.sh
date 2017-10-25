#!/bin/bash
room=$1
pc=$2

echo "bucss-kali-$room-$pc" > /etc/hostname

if [ -n "$(grep puppet /etc/hosts)" ]
then
	sed -i "/puppet/d" /etc/hosts
fi

sudo -- sh -c -e "echo '192.168.$room.41	bucss-kali-$room-master.pg12.local' >> /etc/hosts";
echo -e "[main]\nssldir = /var/lib/puppet/ssl\nserver = bucss-kali-$room-master.pg12.local\n\n[master]\nvardir = /var/lib/puppet\ncadir = /var/lib/puppet/ssl/ca\ndns_alt_names = puppet" > /etc/puppet/puppet.conf
puppet resource service puppet ensure=running enable=true

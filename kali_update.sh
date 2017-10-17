#!/bin/bash
echo "-------------------";
echo "Updating Burp Suite";
echo "-------------------";
curl --output burpsuite 'https://portswigger.net/burp/releases/download?product=free&version=1.7.27&type=jar';
cp ./burpsuite /usr/bin/burpsuite;
rm ./burpsuite;

echo "---------------";
echo "Updating System";
echo "---------------";
apt update;
apt upgrade -y;
apt dist-upgrade -y;
apt --fix-broken install -y;
apt autoremove -y;
echo "----------------";
echo "Update Completed";
echo "----------------";

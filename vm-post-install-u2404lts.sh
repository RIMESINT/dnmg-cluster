/#!usr/bin/env bash

echo "1) Install required packages"
echo "----------------------------"

apt update && \
apt install -y qemu-guest-agent ceph-common ceph-fuse net-tools iputils-ping rsyslog cloud-init

echo "2) Create cfswrite group (gid=7890)"
echo "-----------------------------------"

groupadd -g 7890 cfswrite

echo "3) configure rsyslog (@10.21.26.210:513)"
echo "------------------------------------------------"

printf "\n\n\n# ### Log Forwarding Added ###\n*.* @10.21.26.210:513 \n\n\n# \n" >> /etc/rsyslog.conf

echo "4) configure cloudinit"
echo "----------------------"

systemctl enable cloud-init && cloud-init clean


# end

/#!usr/bin/env bash

echo "1) Install required guest-agent/ceph/network package"
echo "----------------------------------------------------"

apt update && \
apt install -y qemu-guest-agent ceph-common ceph-fuse net-tools iputils-ping rsyslog cloud-init

echo "2) Create cfswrite group with gid=7890"
echo "--------------------------------------"

groupadd -g 7890 cfswrite

echo "3) configure rsyslog to send log to 10.21.26.210"
echo "------------------------------------------------"

printf "\n\n\n# ### Log Forwarding Added ###\n*.* @10.21.26.210:513\n\n#\n" >> /etc/rsyslog.conf

echo "4) configure cloudinit"
echo "----------------------"

systemctl enable cloud-init && cloud-init clean


# end

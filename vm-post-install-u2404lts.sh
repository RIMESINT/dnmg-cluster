/#!usr/bin/env bash

echo "1) Install required guest-agent/ceph/network package"
echo "----------------------------------------------------"

apt update && \
apt install qemu-guest-agent ceph-common ceph-fuse net-tools iputils-ping rsyslog

echo "2) Create cfswrite group with gid=7890"
echo "--------------------------------------"

groupadd -g 7890 cfswrite

echo "3) config rsyslog to send log to 10.21.26.210"
echo "---------------------------------------------"

# end

/#!usr/bin/env bash

echo "Install required guest-agent/ceph/network package"
echo "-------------------------------------------------"

apt update && \
apt install qemu-guest-agent ceph-common ceph-fuse net-tools iputils-ping

echo "Create cfswrite group with gid=7890"
echo "-----------------------------------"

groupadd -g 7890 cfswrite

# end
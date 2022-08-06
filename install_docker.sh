#!/bin/bash
### This script need to be run as root and in the root folder

### Remove any old docker stuff
apt-get remove docker docker-engine docker.io containerd runc

### Install docker-engine
apt-get install ca-certificates curl gnupg lsb-release -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu focal stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 57801F6F5B9EFD43
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io
docker --version
sleep 3



### Install docker-compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sleep 3
mkdir  /usr/local/custom/docker
cd /usr/local/custom/docker
git clone https://github.com/docker/docker-bench-security.git
cd docker-bench-security
sh docker-bench-security.sh




## First rule - delete all
-D

## Increase the buffers to survive stress events.
## Make this bigger for busy systems
-b 8192

## This determine how long to wait in burst of events
--backlog_wait_time 0

## Set failure mode to syslog
-f 1
-w /usr/bin/dockerd -p rwxa -k docker
-w /run/containerd -p rwxa -k docker
-w /var/lib/docker -p rwxa -k docker
-w /etc/docker -p rwxa -k docker
-w /docker.service -p rwxa -k docker
-w /etc/default/docker -p rwxa -k docker
-w /etc/containerd/config.toml -p rwxa -k docker
-w /usr/bin/containerd -p rwxa -k docker
-w /usr/bin/containerd-shim -p rwxa -k docker
-w /usr/bin/containerd-shim-runc-v1 -p rwxa -k docker
-w /usr/bin/containerd-shim-runc-v2 -p rwxa -k docker
-w /usr/bin/runc -p rwxa -k docker
-w /lib/systemd/system/docker.service -p rwxa -k docker
-w /lib/systemd/system/docker.socket -p rwxa -k docker
#!/bin/bash

### Bash script to install, configure and enable snmpv3 service
### Run as root


### Install utilities
apt-get -y install snmp snmpd libsnmp-dev

### Stop snmpd service
systemctl stop snmpd

### Create snmpv3 user
net-snmp-config --create-snmpv3-user -ro -A SuperSecretPassword -X SuperSecretCryptoPassword -a MD5 -x AES monitoring

### Configure snmpd service
sed -i 's/udp:127.0.0.1:161/udp:161,udp6:[::1]:161/g' /etc/snmp/snmpd.conf
echo rouser monitorng > /etc/snmp/snmpd.conf
systemctl enable snmpd
systemctl start snmpd
systemctl status snmpd


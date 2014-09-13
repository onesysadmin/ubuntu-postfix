#!/bin/bash
cd `dirname $0`

# Run preinstall scripts and install postfix
export DEBIAN_FRONTEND=noninteractive
echo force-unsafe-io > /etc/dpkg/dpkg.cfg.d/02apt-speedup
apt-get -qq update

apt-get --no-install-recommends -qq -y install postfix sipcalc

# Remove generated certificate and key
rm /etc/ssl/certs/ssl-cert-snakeoil.pem /etc/ssl/private/ssl-cert-snakeoil.key
find /etc/ssl/certs -type l -xtype l -delete

# Run postinstall scripts
# Cleanup
apt-get -qq clean
rm -f /etc/dpkg/dpkg.cfg.d/02apt-speedup
find /var/lib/apt/lists -mindepth 1 -delete -print
find /tmp /var/tmp -mindepth 2 -delete -print
find . -delete -print

#!/bin/sh

set -e

date > /etc/box_build_time

# Setup sudo to allow no-password sudo for "admin"
groupadd -r admin
usermod -a -G admin scb
cp /etc/sudoers /etc/sudoers.orig
sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=admin' /etc/sudoers
sed -i -e 's/%admin ALL=(ALL) ALL/%admin ALL=NOPASSWD:ALL/g' /etc/sudoers
visudo -cf /etc/sudoers > /dev/null

# Installing SSH keys
mkdir ~/.ssh
chmod 700 ~/.ssh
cd ~/.ssh
# We avoid external calls and create the key with echo
# The result equals this command:
#   wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key" > authorized_keys
chmod 600 ~/.ssh/authorized_keys
chown -R scb ~/.ssh

# Updating and Upgrading dependencies
echo "INFO installing necessary packages. This can take a while."
yum check-update  /dev/null
yum install -y \
  PyYAML \
  python-httplib2 \
  python-jinja2 \
  python-keyczar \
  python-paramiko \
  make \
  python2-devel \
  git \
  curl \
  vim \
  wget \
  zsh > /dev/null

echo "INFO installing necessary packages"
yum install -y epel-release
yum install -y ansible

echo "INFO Initial setup DONE."

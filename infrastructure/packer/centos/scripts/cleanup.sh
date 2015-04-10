#!/bin/sh

set -e

echo "INFO Remove ansible"
#rm -rf /etc/yum.repos.d/{ansible}.repo

echo "INFO Remove unused packages."
yum -y erase gtk2 libX11 hicolor-icon-theme avahi freetype bitstream-vera-fonts
yum -y clean all

echo "INFO Purge command line history"
cat /dev/null > ~/.bash_history || true

echo "INFO Cleanup DONE."

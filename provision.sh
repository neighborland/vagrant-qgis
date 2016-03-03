#!/bin/bash

set -e

grep 'deb http://qgis.org/ubuntugis/ trusty main' /etc/apt/sources.list &> /dev/null || echo "deb http://qgis.org/ubuntugis/ trusty main" >> /etc/apt/sources.list
grep 'deb-src http://qgis.org/ubuntugis/ trusty main' /etc/apt/sources.list &> /dev/null || echo "deb-src http://qgis.org/ubuntugis/ trusty main" >> /etc/apt/sources.list
grep 'deb http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu trusty main' /etc/apt/sources.list &> /dev/null || echo "deb http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu trusty main" >> /etc/apt/sources.list

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key 3FF5FFCAD71472C4
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key 314DF160

apt-get update
apt-get dist-upgrade -y
apt-get install -y \
        python-qgis \
        qgis \
        qgis-plugin-grass

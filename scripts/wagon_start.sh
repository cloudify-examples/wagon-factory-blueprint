#!/bin/sh

ctx logger "Installing tools"

sudo yum -y install epel-release

sudo yum -y install wget unzip

ctx logger "Installing  pip and virtualenv"

sudo yum -y install python-pip python-virtualenv


mkdir /tmp/wagon/

cd /tmp/wagon

virtualenv /tmp/wagon

export PATH=/tmp/wagon/bin:$PATH

ctx logger "Installing wagon version ${wagon_version} "

pip install wagon==${wagon_version}

pip install --upgrade pip==9.0.1

mkdir build

cd build

ctx logger "Downloading Plugin"

wget ${plugin_zip}

unzip `ls`

cd `ls -d */`

echo "cloudify-plugins-common==${cloudify_version}" > constrains.conf

ctx logger "Creating Wagon File"

wagon create -s . -a '--no-cache-dir -c constrains.conf'

sudo mv *.wgn /var/www/html

sudo ls -1 /var/www/html > /var/www/html/index.html
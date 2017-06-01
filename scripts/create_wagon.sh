
mkdir /tmp/wagon/

cd /tmp/wagon

virtualenv /tmp/wagon

. /tmp/wagon/bin/activate

pip install wagon==${1}

pip install --upgrade pip==9.0.1

mkdir build

cd build


wget ${3}

unzip `ls`

cd `ls -d */`

echo "cloudify-plugins-common==${2}" > constrains.conf

wagon create -s . -a '--no-cache-dir -c constrains.conf'

sudo mv *.wgn /var/www/html

sudo ls -1 /var/www/html > /var/www/html/index.html

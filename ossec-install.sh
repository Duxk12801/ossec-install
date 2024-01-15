apt update
apt-get install libevent-dev
apt-get install libsystemd-dev
apt install gcc make libevent-dev zlib1g-dev  libssl-dev libpcre2-dev wget tar -y
git clone https://github.com/atomicturtle/ossec-hids.git
tar -zxvf ossec-hids.git
cd ossec-hids
./install.sh
/var/ossec/bin/ossec-control start
wget https://github.com/ossec/ossec-wui/archive/master.zip
unzip master.zip
mv ossec-wui-master /var/www/html/ossec-wui
cd /var/www/html/ossec-wui
./setup.sh
usermod -a -G ossec www-data
cat /etc/group |grep ossec
chmod 770 tmp/
chgrp www-data tmp/
service apache2 restart
/var/ossec/bin/ossec-control restart


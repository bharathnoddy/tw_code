
#!/bin/bash

yum -y install httpd
cd /var/www/html
mv /tmp/filelist/static .
systemctl enable httpd.service
mv /tmp/filelist/static.conf /etc/httpd/conf.d
systemctl start httpd.service

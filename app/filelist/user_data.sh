
#!/bin/bash
IP="35.154.153.239"
yum install -y  epel-release wget 
yum install -y java-1.8.0-openjdk.x86_64
groupadd tomcat
mkdir /opt/tomcat
useradd -s /bin/nologin -g tomcat -d /opt/tomcat tomcat
cd ~
wget http://www-us.apache.org/dist/tomcat/tomcat-9/v9.0.8/bin/apache-tomcat-9.0.8.tar.gz
tar -zxvf apache-tomcat-9.0.8.tar.gz -C /opt/tomcat --strip-components=1
cd /opt/tomcat
chgrp -R tomcat conf
chmod g+rwx conf
chmod g+r conf/*
chown -R tomcat logs/ temp/ webapps/ work/
chgrp -R tomcat bin
chgrp -R tomcat lib
chmod g+rwx bin
chmod g+r bin/*

mkdir -p /Users/dcameron/persistence/files
chown -R tomcat /Users/dcameron


cp  /tmp/filelist/companyNews.war /opt/tomcat/webapps   #copy
chown tomcat /opt/tomcat/webapps/companyNews.war 
/bin/cp -rf /tmp/filelist/server.xml /opt/tomcat/conf					##COPY
cp /tmp/filelist/keystore    /opt/tomcat						#COPY
chown tomcat  /opt/tomcat/conf/server.xml /opt/tomcat/keystore



cp /tmp/filelist/tomcat.service  /etc/systemd/system/     ##COPY
systemctl enable tomcat.service
systemctl start tomcat.service

sleep 5

cd /opt/tomcat/webapps/companyNews
sed  -i "s+styles/company.css+http://$IP/styles/company.css+g" index.jsp Read.jsp Post.jsp
sed  -i "s+images/logo.png+http://$IP/images/logo.png+g" index.jsp Read.jsp Post.jsp

#!/bin/bash

ansible java -m shell -a 'rm -rf /opt/java/apache-tomcat-8.5.40/webapps/ROOT/*'
ansible java -m shell -a '/opt/java/start-java.sh stop &>/dev/null'

#ansible java -m copy -a "src=/root/.jenkins/workspace/testdas/fcs/target/fcs.war dest=/tmp/fcs.war"

echo "war包解压中请稍等......"
#ansible java -m shell -a 'unzip /tmp/fcs.war -d /opt/java/apache-tomcat-8.5.40/webapps/ROOT/ &>/dev/null'
ansible java -m unarchive -a 'src=/root/.jenkins/workspace/fish-pip/target/fish.war  dest=/opt/java/apache-tomcat-8.5.40/webapps/ROOT/ copy=yes'
echo "================================="
ansible java -m shell -a '/opt/java/start-java.sh start'
ansible java -m shell -a '/opt/java/start-java.sh status'

#ansible java -m shell -a 'mv /tmp/fcs.war /wa-bak/fcs`date +%Y-%m-%d-%H-%M-%S`.war'

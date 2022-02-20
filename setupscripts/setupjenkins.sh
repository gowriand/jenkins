#!/bin/bash

#java_ver="openjdk-8-jdk"
java_ver="openjdk-11-jdk"
echo "Setup apt-key"
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update

echo "Install $java_ver"
sudo apt-get install -y $java_ver
echo "INSTALLED JAVA................." 
java -version

echo "Install jenkins"
sudo apt install -y jenkins
sleep 30
ps aux |grep jenkins
echo "INSTALLED  JENKINS................." 
echo "USE PASS to SETUP: "`cat /var/lib/jenkins/secrets/initialAdminPassword`

#sudo wget -O /var/lib/jenkins/secrets/initialAdminPassword https://raw.githubusercontent.com/gowriand/jenkins/master/setupscripts/initialAdminPassword
##echo "USE PASS to SETUP: "`cat /var/lib/jenkins/secrets/initialAdminPassword`
 
 


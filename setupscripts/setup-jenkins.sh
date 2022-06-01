#!/bin/bash

java_ver="openjdk-8-jdk"
#java_ver="openjdk-11-jdk"
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


#create ssh pvt key in master server
runuser -l  jenkins  -c 'ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa <<< y'
runuser -l  jenkins  -c 'cp /jenkins/setupscripts/ssh/id_rsa  /var/lib/jenkins/.ssh/id_rsa'
chmod 600 /var/lib/jenkins/.ssh/id_rsa
 
echo "INSTALLED  JENKINS................." 
#sudo cp /var/lib/jenkins/secrets/initialAdminPassword /var/lib/jenkins/secrets/initialAdminPassword_bak
#sudo cp initialAdminPassword /var/lib/jenkins/secrets/initialAdminPassword
echo "USE PASS to SETUP: "`cat /var/lib/jenkins/secrets/initialAdminPassword`


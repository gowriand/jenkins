#!/bin/bash

#java_ver="openjdk-8-jdk"
java_ver="openjdk-11-jdk"

echo "Install $java_ver"
sudo apt update
sudo apt-get install -y $java_ver
echo "INSTALLED JAVA................." 
java -version


echo "Setup apt-key"

curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update

echo "Install jenkins................................."
sudo apt install -y jenkins
sleep 30
ps aux |grep jenkins


#create ssh pvt key in master server
runuser -l  jenkins  -c 'ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa <<< y'
runuser -l  jenkins  -c 'cp /jenkins/setupscripts/ssh/id_rsa  /var/lib/jenkins/.ssh/id_rsa'
chmod 600 /var/lib/jenkins/.ssh/id_rsa
 
echo "INSTALLED  JENKINS................." 
echo "USE PASS to SETUP: "`cat /var/lib/jenkins/secrets/initialAdminPassword`


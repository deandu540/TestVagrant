#!/bin/bash

function installCommon {
        echo "install tar wget git"
        yum install -y tar wget git
}


function installJava {
        echo "install open jdk"
        wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz"
        tar xzf jdk-7u79-linux-x64.tar.gz
        mv jdk1.7.0_79 java
        mv java /opt/
        rm jdk-7u79-linux-x64.tar.gz
        echo "creating java environment variables"
        echo export JAVA_HOME=/opt/java >> /etc/profile.d/java.sh
        echo export PATH=\${JAVA_HOME}/bin:\${PATH} >> /etc/profile.d/java.sh
}

function setRootPasswd {
        echo "[setup root password & gen ssh key]"
        echo "vagrant" | passwd root --stdin
}

function setssh {
        mkdir -p /root/.ssh
        ssh-keygen -t rsa -N "" -f "/root/.ssh/id_rsa"
}


function setHosts {
        rm /etc/hosts
        echo "192.168.1.44      dfnode1" >> /etc/hosts
	echo "192.168.1.45      dfnode2" >> /etc/hosts
	echo "192.168.1.46      dfnode3" >> /etc/hosts



        #TOTAL_NODES=2  
        #for i in $(seq 1 $TOTAL_NODES)
        #do 
        #       entry="10.211.55.10${i} node${i}"
        #       echo "adding ${entry}"
        #       echo "${entry}" >> /etc/nhosts
        #done
        #cp /etc/nhosts /etc/hosts
}


installCommon
#installJava
setRootPasswd
setssh
setHosts


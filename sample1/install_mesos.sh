#!/bin/bash


function preInstall {

yum install -y tar wget git
wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
yum install -y epel-release
cat > /etc/yum.repos.d/wandisco-svn.repo <<EOF
[WANdiscoSVN]
name=WANdisco SVN Repo 1.9
enabled=1
baseurl=http://opensource.wandisco.com/centos/7/svn-1.9/RPMS/$basearch/
gpgcheck=1
gpgkey=http://opensource.wandisco.com/RPM-GPG-KEY-WANdisco
EOF
yum update systemd
yum groupinstall -y "Development Tools"
yum install -y apache-maven python-devel java-1.8.0-openjdk-devel zlib-devel libcurl-devel openssl-devel cyrus-sasl-devel cyrus-sasl-md5 apr-devel subversion-devel apr-util-devel

}

function mesos {
wget http://www.apache.org/dist/mesos/0.28.1/mesos-0.28.1.tar.gz
tar -zxf mesos-0.28.1.tar.gz
mv mesos-0.28.1 mesos
cd mesos
./bootstrap
mkdir build
cd build
../configure
make

}




preInstall
mesos


#!/bin/bash

#To set host name as a master

hostnamectl set-hostname master

#to Disable firewall

systemctl stop firewalld.service

systemctl disable firewalld.service

#To disable Selinux
cd /etc/selinux

setenforce 0

sed -i 's/^SELINUX=.*/SELINUX=permissive/g' /etc/selinux/config

#To add the host file details
echo "add master and client hosts and ip details press ctrl+d to save"
while xyz= read -r line;
do
 user_input+="$line"$'\n'

done

echo "$user_input" >> /etc/hosts

#To install hpc repos
yum install http://build.openhpc.community/OpenHPC:/1.3/CentOS_7/x86_64/ohpc-release-1.3-1.el7.x86_64.rpm -y

#To install utilities

yum -y install yum-utils -y

#To install repos

wget -P /etc/yum.repos.d https://xcat.org/files/xcat/repos/yum/latest/xcat-core/xcat-core.repo --no-check-certificate

#To install ganglia

yum install ganglia-gmond-ohpc -y


cd /etc/ganglia


read -p "Enter the name of cluster: " clustername

#To edit the gmond file

sed -i '30s/unspecified/'"$clustername"'/g' gmond.conf

ipp=`cat /etc/hosts | grep master | awk '{ print $1 }'`

sed -i '50s/239\.2\.11\.71/'"$ipp"'/g' gmond.conf

# to comment line 57 and 59

sed -i '57s/^/# /g' gmond.conf

sed -i '59s/^/# /g' gmond.conf

#check gmond status

systemctl start gmond

systemctl enable gmond

systemctl status gmond


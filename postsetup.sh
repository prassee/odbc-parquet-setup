#!/usr/bin/bash 

apt update 

apt -y upgrade

apt -y install mysql-client unixodbc odbcinst wget  

wget https://downloads.mysql.com/archives/get/p/10/file/mysql-connector-odbc-5.3.13-linux-glibc2.12-x86-64bit.tar.gz

tar -xvf mysql-connector-odbc-5.3.13-linux-glibc2.12-x86-64bit.tar.gz

cd mysql-connector-odbc-5.3.13-linux-ubuntu18.04-x86-64bit

cp bin/* /usr/local/bin
cp lib/* /usr/local/lib

myodbc-installer -a -d -n  "MySQL ODBC 5.3 Unicode Driver" -t "Driver=/usr/local/lib/libmyodbc5w.so"
myodbc-installer -a -d -n  "MySQL ODBC 5.3 ANSI Driver" -t "Driver=/usr/local/lib/libmyodbc5a.so"


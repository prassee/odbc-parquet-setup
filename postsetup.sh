#!/usr/bin/bash

apt update 

apt -y upgrade

apt -y install mysql-client unixodbc odbcinst wget  

wget https://downloads.mysql.com/archives/get/p/10/file/mysql-connector-odbc-5.3.13-linux-glibc2.12-x86-64bit.tar.gz

wget https://github.com/pacman82/odbc2parquet/releases/download/v0.15.6/odbc2parquet-x86_64-ubuntu.gz

gunzip odbc2parquet-x86_64-ubuntu.gz

chmod a+x odbc2parquet-x86_64-ubuntu

mv odbc2parquet-x86_64-ubuntu /usr/local/bin/odbc2parquet

tar -xvf mysql-connector-odbc-5.3.13-linux-glibc2.12-x86-64bit.tar.gz

cp mysql-connector-odbc-5.3.13-linux-glibc2.12-x86-64bit/bin/* /usr/local/bin
cp mysql-connector-odbc-5.3.13-linux-glibc2.12-x86-64bit/lib/* /usr/local/lib

myodbc-installer -a -d -n  "MySQL ODBC 5.3 Unicode Driver" -t "Driver=/usr/local/lib/libmyodbc5w.so"
myodbc-installer -a -d -n  "MySQL ODBC 5.3 ANSI Driver" -t "Driver=/usr/local/lib/libmyodbc5a.so"

cp odbc2parquet /usr/local/bin
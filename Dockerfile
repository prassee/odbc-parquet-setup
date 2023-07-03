FROM ubuntu:22.04

# FROM mysql/mysql-server:latest

RUN apt update 

RUN apt -y upgrade

RUN apt -y install mysql-client unixodbc odbcinst wget  

RUN wget https://downloads.mysql.com/archives/get/p/10/file/mysql-connector-odbc-5.3.13-linux-glibc2.12-x86-64bit.tar.gz

RUN tar -xvf mysql-connector-odbc-5.3.13-linux-glibc2.12-x86-64bit.tar.gz

cd mysql-connector-odbc-5.3.13-linux-ubuntu18.04-x86-64bit

cp bin/* /usr/local/bin
cp lib/* /usr/local/lib

myodbc-installer -a -d -n  "MySQL ODBC 5.3 Unicode Driver" -t "Driver=/usr/local/lib/libmyodbc5w.so"
myodbc-installer -a -d -n  "MySQL ODBC 5.3 ANSI Driver" -t "Driver=/usr/local/lib/libmyodbc5a.so"



# RUN apt install -y unixodbc-dev wget

# RUN wget https://github.com/pacman82/odbc2parquet/releases/download/v0.15.6/odbc2parquet-x86_64-ubuntu.gz

# RUN gunzip odbc2parquet-x86_64-ubuntu.gz

# RUN chmod a+x odbc2parquet-x86_64-ubuntu

# RUN mv odbc2parquet-x86_64-ubuntu odbc2parquet
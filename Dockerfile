FROM centos:centos7
MAINTAINER khigashi

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN yum -y install wget epel-release

RUN wget http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN rpm -Uvh ./remi-release-7.rpm
RUN sed -i '4a priority=1' /etc/yum.repos.d/remi-php71.repo
RUN yum -y install --enablerepo=remi-php71 php php-fpm php-mcrypt php-cli php-common php-devel php-gd php-mbstring php-mysqlnd php-opcache php-pdo php-pear php-pecl-apcu php-pecl-zip php-process php-xml
RUN yum clean all

RUN yum install -y httpd
RUN yum clean all 
COPY ./conf/httpd.conf /etc/httpd/conf/httpd.conf

RUN rpm -ivh http://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm
RUN yum -y install mysql-community-server

RUN yum -y update
RUN yum clean all
RUN yum -y install git

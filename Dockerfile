FROM centos:6
MAINTAINER Milind Potdar <mpotdar86@gmail.com>

# Install the Apache
RUN yum -y update && \
yum -y install httpd && \
yum clean all

# Install SSL extension
RUN yum -y install mod_ssl

# Expose the Port 80 443
EXPOSE 80 443

# Install the PHP
RUN yum -y update
RUN yum install php* -y

RUN yum -y install wget
RUN wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
RUN rpm -Uvh remi-release-6*.rpm epel-release-6*.rpm
RUN yum -y update
RUN yum -y install php-mcrypt*

# Setting working directory
WORKDIR /var/www/html

# Setting Entrypoint
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]

FROM ubuntu:latest
MAINTAINER Alena Pakhomova <zerta664@gmail.com>

# Apache & php &git
RUN apt-get update && DEBIAN_FRONTEND=noninteractive  apt-get -y install  apache2 php libapache2-mod-php lynx git


RUN a2enmod php7.2


# Expose apache.
EXPOSE 80


RUN mkdir -p  /var/www/
WORKDIR /var/www/

ADD id_rsa /root/

RUN GIT_SSH_COMMAND='ssh -i /root/id_rsa -o "StrictHostKeyChecking no"' git clone git@github.com:zerta664/je.git

ADD www.conf /etc/apache2/sites-enabled/000-default.conf

ADD sync.sh /etc/cron.hourly/


CMD /usr/sbin/apache2ctl -D FOREGROUND


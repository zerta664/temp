FROM ubuntu:xenial
MAINTAINER Pakhomova <zerta664@gmail.com>

COPY power/apt/preferences.d/pdns /etc/apt/preferences.d/pdns
RUN apt-get update && apt-get install -y curl sudo \
	&& curl https://repo.powerdns.com/FD380FBB-pub.asc | sudo apt-key add - \
	&& echo "deb [arch=amd64] http://repo.powerdns.com/ubuntu xenial-auth-40 main" > /etc/apt/sources.list.d/pdns.list

ENV MYSQL_PWD Pwd123
RUN echo "mysql-server mysql-server/root_password password $MYSQL_PWD" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password $MYSQL_PWD" | debconf-set-selections

RUN apt-get update && apt-get install -y  \
	wget \
	netcat-openbsd \
	git \
	supervisor \
	mysql-client \
	mysql-server \
	pdns-server \
	pdns-backend-mysql \
	&& apt-get clean 

COPY power/pdns/pdns.conf /etc/powerdns/pdns.conf
COPY power/pdns/pdns.d/ /etc/powerdns/pdns.d/
COPY power/mysql/pdns.sql /pdns.sql
COPY power/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY start.sh /start.sh

EXPOSE 53 
EXPOSE 53/udp

CMD ["/bin/bash", "/start.sh"]
	

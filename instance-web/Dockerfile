FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt-get install -y 
RUN apt install software-properties-common -y
RUN apt install libtcnative-1 nano -y
RUN apt install apache2 -y 
RUN apt install curl -y 
RUN apt install wget -y 

RUN apt-get install -y --force-yes php7.2 
RUN apt-get install -y --force-yes php7.2-zip 
RUN apt-get install -y --force-yes php7.2-mysql 
RUN apt-get install -y --force-yes php7.2-bcmath 
RUN apt-get install -y --force-yes php7.2-curl 
RUN apt-get install -y --force-yes php7.2-gd 
RUN apt-get install -y --force-yes php7.2-imap 
RUN apt-get install -y --force-yes php7.2-soap 
RUN apt-get install -y --force-yes php7.2-recode 
RUN apt-get install -y --force-yes php7.2-snmp 
RUN apt-get install -y --force-yes php7.2-tidy 
RUN apt-get install -y --force-yes php7.2-xsl
RUN apt-get install -y --force-yes php7.2-xmlrpc 
RUN apt-get install -y --force-yes php7.2-mbstring 
RUN apt-get install -y --force-yes php7.2-json 
RUN apt-get install -y --force-yes php7.2-sqlite3 
RUN apt-get install -y --force-yes php7.2-dev 
RUN apt-get install -y --force-yes libapache2-mod-php7.2 
RUN apt-get install -y --force-yes php-pear 
RUN apt-get install -y --force-yes php-apcu 
RUN apt-get install -y --force-yes php-redis 
RUN apt-get install -y --force-yes php-gmp 
RUN apt-get install -y --force-yes composer 

RUN apt-get clean 

RUN rm -rf /var/lib/apt/lists/* 
RUN a2enmod cache cache_disk deflate expires headers filter rewrite ssl socache_dbm proxy proxy_balancer proxy_http 
    
RUN curl -s https://packagecloud.io/install/repositories/phalcon/stable/script.deb.sh | bash 
RUN apt update 
RUN apt-get install -y php7.2-phalcon=3.4.* 
RUN phpenmod redis

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
ENV NVM_DIR /root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install 14.17.6 && nvm use 14.17.6
RUN ln -s "/root/.nvm/versions/node/v14.17.6/bin/node" /usr/bin/node
RUN ln -s "/root/.nvm/versions/node/v14.17.6/bin/npm" /usr/bin/npm

RUN sed -i 's/^;date.timezone =/date.timezone = "America\/Chicago"/' /etc/php/7.2/apache2/php.ini
RUN sed -i 's/^display_errors = Off/display_errors = On/' /etc/php/7.2/apache2/php.ini
RUN sed -i 's/^;error_log =/error_log = \/var\/log\/php_errors.log/' /etc/php/7.2/apache2/php.ini
RUN sed -i 's/^error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/' /etc/php/7.2/apache2/php.ini
RUN sed -i 's/^;session.gc_maxlifetime = 1440/session.gc_maxlifetime = 28800/' /etc/php/7.2/apache2/php.ini
RUN sed -i 's/^;session.cache_expire = 180/session.cache_expire = 480/' /etc/php/7.2/apache2/php.ini

RUN apt-get install -y --force-yes vim 

COPY ./apache/browscap.ini  /etc/php/7.2/apache2/browscap.ini 

RUN sed -i "s/;browscap = extra\/browscap.ini/browscap = \/etc\/php\/7.2\/apache2\/browscap.ini/g" /etc/php/7.2/apache2/php.ini 
RUN sed -i "s/memory_limit = 128M/memory_limit = 2048M/g" /etc/php/7.2/apache2/php.ini

COPY ./apache/bts.conf      /etc/apache2/sites-available/bts.conf
COPY ./apache/quaweb.conf   /etc/apache2/sites-available/quaweb.conf
COPY ./apache/setenv.conf   /etc/apache2/conf-available/setenv.conf

RUN ln -s /etc/apache2/sites-available/bts.conf     /etc/apache2/sites-enabled/bts.conf
RUN ln -s /etc/apache2/sites-available/quaweb.conf  /etc/apache2/sites-enabled/quaweb.conf
RUN ln -s /etc/apache2/conf-available/setenv.conf   /etc/apache2/conf-enabled/setenv.conf

RUN rm /etc/apache2/sites-available/000-default.conf
RUN rm /etc/apache2/sites-enabled/000-default.conf

WORKDIR /var/www/mcets/QUAWEB/vuefrontend

ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

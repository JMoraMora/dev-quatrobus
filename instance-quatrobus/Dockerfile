FROM php:7.2-apache

RUN apt-get update -y
RUN apt-get install vim -y
RUN apt-get install libzip-dev -y
RUN apt-get install libpng-dev -y
RUN apt-get install libxml2-dev -y 
RUN apt-get install libxslt-dev -y
RUN apt-get install librecode-dev -y
RUN apt-get install libssl-dev -y
RUN apt-get install libtidy-dev -y
RUN apt-get install libsnmp-dev -y

RUN apt install -y curl
RUN apt install -y libcurl4
RUN apt install -y libcurl3-dev
RUN a2enmod filter rewrite cache cache_disk deflate expires headers ssl 

RUN docker-php-ext-install gettext
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo_mysql 
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install zip
RUN docker-php-ext-install gd
RUN docker-php-ext-install soap
RUN docker-php-ext-install xsl
RUN docker-php-ext-install recode
RUN apt install -y libsqlite3-0
RUN apt-get update && apt-get install -y sqlite3 libsqlite3-dev
RUN docker-php-ext-install pdo_sqlite

RUN pecl install apcu && docker-php-ext-enable apcu 

COPY ./apache/quatrobus.conf       /etc/apache2/sites-available/quatrobus.conf
COPY ./apache/setenv.conf          /etc/apache2/conf-available/setenv.conf
COPY ./apache/browscap.ini         /usr/local/etc/php/browscap.ini 

RUN ln -s /etc/apache2/sites-available/quatrobus.conf /etc/apache2/sites-enabled/quatrobus.conf
RUN ln -s /etc/apache2/conf-available/setenv.conf /etc/apache2/conf-enabled/setenv.conf

RUN mv /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini
RUN rm -f /usr/local/etc/php/php.ini-production

RUN rm /etc/apache2/sites-available/000-default.conf
RUN rm /etc/apache2/sites-enabled/000-default.conf

RUN sed -i 's/^;browscap =.*/browscap = \/usr\/local\/etc\/php\/browscap.ini/' /usr/local/etc/php/php.ini

RUN sed -i 's/^;date.timezone =/date.timezone = "America\/Chicago"/' /usr/local/etc/php/php.ini
RUN sed -i 's/^display_errors = Off/display_errors = On/' /usr/local/etc/php/php.ini
RUN sed -i 's/^;error_log =/error_log = \/var\/log\/php_errors.log/' /usr/local/etc/php/php.ini
RUN sed -i 's/^error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT/error_reporting = E_ALL/' /usr/local/etc/php/php.ini
RUN sed -i 's/^;session.gc_maxlifetime = 1440/session.gc_maxlifetime = 28800/' /usr/local/etc/php/php.ini
RUN sed -i 's/^;session.cache_expire = 180/session.cache_expire = 480/' /usr/local/etc/php/php.ini

RUN docker-php-ext-install opcache

VOLUME /var/www
WORKDIR /var/www

EXPOSE 80

FROM php:8.1-cli

RUN apt-get update && apt-get install -y \
    libzip-dev \
    unzip \
    git \
    curl \
    && docker-php-ext-install zip pdo pdo_mysql

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm

WORKDIR /var/www/qmonitor

# RUN composer install

# CMD ["php", "artisan", "serve"]
CMD ["tail", "-f", "/dev/null"]
FROM php:8.2-fpm as base

RUN apt update \
    && apt install -y zlib1g-dev g++ git libicu-dev zip libzip-dev zip \
    && docker-php-ext-install intl opcache pdo pdo_mysql \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip

WORKDIR /app

COPY --from=composer /usr/bin/composer /usr/bin/composer

COPY --link . ./

RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
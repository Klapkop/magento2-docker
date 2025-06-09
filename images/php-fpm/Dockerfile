ARG PHP_VERSION="8.3"


FROM php:${PHP_VERSION}-fpm as build
ARG COMPOSER_VERSION="2.8.9"

RUN  curl https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar -o composer.phar && \
     curl https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar.sha256sum -o composer.phar.sha256sum && \
     sha256sum -c composer.phar.sha256sum && install -m 0755 composer.phar /bin/composer 

FROM php:${PHP_VERSION}-fpm

RUN DEBIAN_FRONTEND=noninteractive apt-get -y update && apt-get install -y \
    libicu-dev \
    libzip-dev \
    libpng-dev \
    libxml2-dev \
    libxslt1-dev \
    librabbitmq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install -j$(nproc) \
    bcmath \
    intl \
    ftp \
    zip \
    gd \
    pdo_mysql \
    soap \
    xsl \
    sockets
RUN pecl install amqp \
    && docker-php-ext-enable amqp

COPY --from=build /bin/composer /bin/composer



    
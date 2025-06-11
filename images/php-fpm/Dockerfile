ARG PHP_VERSION="8.3"

FROM php:${PHP_VERSION}-fpm
ARG COMPOSER_VERSION="2.8.9"

RUN DEBIAN_FRONTEND=noninteractive apt-get -y update && apt-get install -y \
    unzip \
    libicu-dev \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zlib1g-dev \
    libxml2-dev \
    libxslt1-dev \
    librabbitmq-dev \
    msmtp-mta \
    mailutils \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-jpeg --with-freetype && \
    docker-php-ext-install -j$(nproc) \
    bcmath \
    intl \
    ftp \
    zip \
    gd \
    pdo_mysql \
    soap \
    xsl \
    sockets \
    opcache

RUN pecl install amqp \
    && docker-php-ext-enable amqp

# Install composer
RUN  cd /tmp && curl https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar -o composer.phar && \
     curl https://getcomposer.org/download/${COMPOSER_VERSION}/composer.phar.sha256sum -o composer.phar.sha256sum && \
     sha256sum -c composer.phar.sha256sum && install -m 0755 composer.phar /bin/composer 


# COPY --from=build /bin/composer /bin/composer
RUN adduser --home /var/www --disabled-password app

# Magento php config
COPY magento-php.ini /usr/local/etc/php/conf.d/magento2.ini
COPY opcache.ini /usr/local/etc/php/conf.d/opcache.ini


# Redirect mail to maildev
COPY --chown=app:app msmtprc  /var/www/.msmtprc
RUN chmod 600 /var/www/.msmtprc

USER app




    
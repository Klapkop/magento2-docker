ARG PHP_VERSION="8.3"

FROM php:${PHP_VERSION}-fpm-alpine
LABEL org.opencontainers.image.source=https://github.com/Klapkop/magento2-docker

ENV PHP_EXTENSIONS bcmath ftp gd intl opcache pcntl pdo_mysql soap sockets xsl zip

RUN apk --no-cache add \
        ca-certificates \
        gettext \
        bash \
        git \
        curl \
        rsync \
        sudo \
        patch \
        freetype \
        libpng \
        libjpeg-turbo \
        libxslt \
        libzip \
        icu-data-full \
        nginx \
        supervisor \
        postfix \
        unzip 



# Install and configure PHP extensions
RUN apk --no-cache add --virtual .build-deps \
     freetype-dev icu-dev zlib-dev libjpeg-turbo-dev libpng-dev libxml2-dev libxslt-dev libzip-dev linux-headers $PHPIZE_DEPS\
    && docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
    && docker-php-ext-install -j$(nproc) $PHP_EXTENSIONS \
    && pecl install apcu redis lzf xdebug zstd \
    && docker-php-ext-enable apcu redis lzf zstd \
    && mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" \
    && apk del .build-deps

# Install composer
COPY --from=composer:2.8 /usr/bin/composer /usr/bin/composer


# Magento php config
COPY conf/magento-php.ini /usr/local/etc/php/conf.d/magento2.ini

COPY conf/supervisord.conf /etc/supervisord.conf
COPY bin/run.sh bin/conf.sh /


# Setup persistent data
RUN mkdir -p /data/var data/media data/cache && \
    chown -R nginx:www-data /data && mkdir -p pub/media app/etc && \
    ln -s /data/var var  && \
    ln -s /data/media pub/media  && \
    ln -s /data/env.php app/etc/env.php && \
    chown -R nginx:www-data . && chmod -R g+rwx var pub/media

CMD ["/run.sh"]






    
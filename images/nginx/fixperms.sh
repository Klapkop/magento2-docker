#!/bin/sh
cd /var/www/html
# find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} +
# find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} +
# chown -R :www-data .
chmod u+x bin/magento
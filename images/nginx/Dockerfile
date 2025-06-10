FROM nginxinc/nginx-unprivileged

USER root
COPY fixperms.sh /docker-entrypoint.d/40-magento-fixperms.sh
RUN chmod +x /docker-entrypoint.d/*
COPY magento2.conf /etc/nginx/conf.d/magento2.conf

#RUN adduser --home /var/www/magento2 --disabled-password app
USER 1000

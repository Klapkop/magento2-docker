#! /usr/bin/env sh
sh /conf.sh
exec /usr/bin/supervisord --nodaemon --configuration /etc/supervisord.conf
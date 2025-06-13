#!/usr/bin/env sh

### Setup mail relay ###
if [ ! -z "$MAIL_RELAY_HOST" ]; then
    postconf -e "relayhost=$MAIL_RELAY_HOST"
fi
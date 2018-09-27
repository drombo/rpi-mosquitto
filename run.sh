#!/bin/sh

set -e

mkdir -p /srv/mosquitto/data /srv/mosquitto/config /srv/mosquitto/log

cp -rn /tmp/mosquitto/config/* /srv/mosquitto/config/

chown -R mosquitto /srv/mosquitto/

/usr/sbin/mosquitto -c /srv/mosquitto/config/mosquitto.conf
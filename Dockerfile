# Pull base image
FROM resin/rpi-raspbian:stretch
LABEL maintainer="sebastian.breit@drombo.de" \
      forked.from="https://github.com/pascaldevink/rpi-mosquitto"

VOLUME ["/srv/mosquitto"]

EXPOSE 1883 9001

COPY config /tmp/mosquitto/config
COPY run.sh /srv/runmosquitto.sh

RUN apt-get update && \
    apt-get install -y apt-transport-https wget && \
    wget -q -O - http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key | apt-key add - && \
    wget -q -O /etc/apt/sources.list.d/mosquitto-stretch.list http://repo.mosquitto.org/debian/mosquitto-stretch.list && \
    apt-get install -y mosquitto && \
    apt-get clean && \
    adduser --system --disabled-password --disabled-login mosquitto

CMD /srv/runmosquitto.sh

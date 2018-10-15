# Pull base image
#FROM armhf/alpine
FROM resin/amd64-alpine
LABEL maintainer="Sebastian Breit <sebastian.breit@drombo.de>"

VOLUME ["/srv/mosquitto"]

EXPOSE 1883 9001 8883

COPY config /tmp/mosquitto/config
COPY run.sh /srv/runmosquitto.sh
COPY root /
RUN  chmod a+x /usr/local/sbin/*

# Install packages
RUN apk --no-cache add --update mosquitto libressl

CMD /srv/runmosquitto.sh

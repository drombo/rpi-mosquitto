# Pull base image
FROM armhf/alpine

LABEL maintainer="sebastian.breit@drombo.de"

VOLUME ["/srv/mosquitto"]

EXPOSE 1883 9001

COPY config /tmp/mosquitto/config
COPY run.sh /srv/runmosquitto.sh

# Install packages
RUN apk --no-cache add mosquitto mosquitto-clients

CMD /srv/runmosquitto.sh


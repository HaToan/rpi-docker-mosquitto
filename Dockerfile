FROM balenalib/rpi-raspbian
RUN apt-get update && apt-get install -y wget

RUN wget -q -O - http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key | apt-key add -
RUN wget -q -O wget -O /etc/apt/sources.list.d/mosquitto-bullseye.list http://repo.mosquitto.org/debian/mosquitto-bullseye.list
RUN apt-get update && apt-get install mosquitto -y

RUN adduser --system --disabled-password --disabled-login mosquitto
COPY config /mosquitto/config

EXPOSE 1883 9001
CMD /usr/sbin/mosquitto -c /mosquitto/config/mosquitto.conf

FROM alpine:latest
MAINTAINER Garret Rumohr <@garret>


# Install boinc client
RUN apk update && apk upgrade
RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing boinc tzdata

User root

WORKDIR /var/lib/boinc

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# BOINC RPC port
EXPOSE 31416 80 443




ENTRYPOINT ["/entrypoint.sh"]

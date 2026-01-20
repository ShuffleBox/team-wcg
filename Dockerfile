
FROM alpine:latest
MAINTAINER Garret Rumohr <@garret>


# Install boinc client
RUN apk update && apk upgrade
RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing boinc tzdata

User root

# BOINC RPC port
EXPOSE 31416 80 443

WORKDIR /var/lib/boinc

ENTRYPOINT ["/usr/bin/boinc", "--allow_remote_gui_rpc", "--attach_project"]
CMD ["www.worldcommunitygrid.org", "1137891_95be76b624523c7db127418b0f9c0c39"]

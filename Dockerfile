
FROM alpine:latest
MAINTAINER Garret Rumohr <@garret>


# Install boinc client
RUN apk update && apk upgrade
RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing boinc tzdata

User root

# BOINC RPC port
EXPOSE 31416 80 443

WORKDIR /var/lib/boinc

CMD ["if [ ! -f client_state.xml ]; then \
        /usr/bin/boinc --allow_remote_gui_rpc --attach_project https://www.worldcommunitygrid.org \"$WCG_ACCOUNT_KEY\"; \
      else \
        /usr/bin/boinc --allow_remote_gui_rpc; \
      fi"]

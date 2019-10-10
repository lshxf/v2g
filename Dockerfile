FROM alpine:latest
ENV CONFIG_JSON="{"inbounds":[{"port":80,"protocol":"vmess","settings":{"clients":[{"id":"ad806487-2d26-4636-98b6-ab85cc8521f7","alterId":64}]},"streamSettings":{"network":"ws"}}],"outbounds":[{"protocol":"freedom","settings":{}}]}"
RUN apk add --no-cache --virtual .build-deps ca-certificates curl bash \
 && curl https://install.direct/go.sh | bash \
 && rm -rf /usr/bin/v2ray/geoip.dat /usr/bin/v2ray/geosite.dat \
 && chgrp -R 0 /etc/v2ray \
 && chmod -R g+rwX /etc/v2ray
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
RUN /configure.sh
EXPOSE 80

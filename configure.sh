#!/bin/bash
# Clear previous configuration
cat /dev/null > /etc/v2ray/config.json
# V2Ray new configuration
#echo "${CONFIG_JSON}" > /etc/v2ray/config.json
echo '{"inbounds":[{"port":${PORT},"protocol":"vmess","settings":{"clients":[{"id":"ad806487-2d26-4636-98b6-ab85cc8521f7","alterId":64}]},"streamSettings":{"network":"ws","wsSettings":{"path":"/ws"}}}],"outbounds":[{"protocol":"freedom","settings":{}}]}' > /etc/v2ray/config.json

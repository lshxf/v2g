#!/bin/sh
# Download and install V2Ray
curl -L -H "Cache-Control: no-cache" -o /v2ray.zip https://github.com/v2ray/v2ray-core/releases/latest/download/v2ray-linux-64.zip
mkdir /usr/bin/v2ray /etc/v2ray
touch /etc/v2ray/config.json
unzip /v2ray.zip "v2ray" -d /usr/bin/v2ray/v2ray
unzip /v2ray.zip "v2ctl" -d /usr/bin//v2ray/v2ctl
# Remove /v2ray.zip
rm -rf /v2ray.zip
# V2Ray new configuration
cat <<-EOF > /etc/v2ray/config.json
{
  "inbounds": [
  {
    "port": ${PORT},
    "protocol": "vmess",
    "settings": {
      "clients": [
        {
          "id": "${UUID}",
          "alterId": 64
        }
      ]
    },
    "streamSettings": {
      "network": "ws"
    }
  }
  ],
  "outbounds": [
  {
    "protocol": "freedom",
    "settings": {}
  }
  ]
}
EOF
/usr/bin/v2ray/v2ray -config=/etc/v2ray/config.json

#!/bin/bash
# Install V2Ray
curl https://install.direct/go.sh | bash
# Remove extra functions
rm -rf /usr/bin/v2ray/geosite.dat /usr/bin/v2ray/geoip.dat
# Clear previous configuration
cat /dev/null > /etc/v2ray/config.json
# V2Ray new configuration
cat <<-EOF > /etc/v2ray/config.json
{
	"inbounds": [{
		"port": ${PORT},
		"protocol": "vmess",
		"settings": {
			"clients": [{
				"id": "${UUID}",
				"alterId": 64
			}]
		},
		"streamSettings": {
			"network": "ws"
		}
	}],
	"outbounds": [{
		"protocol": "freedom",
		"settings": {}
	}]
}
EOF
/usr/bin/v2ray/v2ray -config=/etc/v2ray/config.json

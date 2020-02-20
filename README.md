# V2Ray Heroku

## 重要

**由于 V2Ray 修改了自动安装脚本，导致该镜像在 Heroku 无法运行。请在 2020 年 2 月 20 日前部署过本镜像的用户，删除原先的应用，并重新在 Heroku 部署本镜像。**

**已经 Fork 过本项目的用户，请重新 Fork 一次。**

## 概述

用于在 Heroku 上部署 V2Ray Websocket。

**Heroku 为我们提供了免费的容器服务，我们不应该滥用它，所以本项目不宜做为长期翻墙使用。**

**可以部署两个以上的应用，实现[负载均衡](https://toutyrater.github.io/app/balance.html)，避免长时间大流量连接某一应用而被 Heroku 判定为滥用。**

**Heroku 的网络并不稳定，部署前请三思。**

## 镜像

本镜像仅 6MB，比起其他用于 Heroku 的 V2Ray 镜像，不会因为大量占用资源而被封号。

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://dashboard.heroku.com/new?template=https%3A%2F%2Fgithub.com%2Fbclswl0827%2Fv2ray-heroku)

## ENV 设定

### UUID

`UUID` > `一个 UUID，供用户连接时验证身份使用`。

## 注意

WebSocket 路径为 /。

AlterID 为 64。

V2Ray 将在部署时自动安装最新版本。

**出于安全考量，除非使用 CDN，否则请不要使用自定义域名，而使用 Heroku 分配的二级域名，以实现 V2Ray Websocket + TLS。**

# Data Generator for Project Happyswing

This generator is creating a stream of MQTT messages simulating up to 6 ESP32
boards sending accelerometer data while swinging.

## Requirements

- Docker

## How to run locally and develop

To just start node-red: `docker compose up node-red`

If you want to start all services: `docker compose up -d`

## Services and web interfaces

- Node-Red: <http://localhost:1880>
- EMQX: <http://localhost:18083>, use client mqttx.app, user: admin, password: public
- Grafana: <http://localhost:3000>, user: admin, password: password
- Bind (DNS): Port 53

## How to use in another project

docker-compose.yml:

```yaml
version: "3"

services:
  generator:
    image: jodok/happyswing-generator:latest
    pull_policy: always
    container_name: generator
    environment:
      - NODE_RED_CREDENTIAL_SECRET=<YOUR_SECRET>
    ports:
      - "1880:1880"
    networks:
      - happyswing-net

networks:
  happyswing-net:
    name: happyswing-net
```

## Reading material

How swings work (german), in subfolder `docs`: <https://web.archive.org/web/20220419174726/http://www.didaktik.physik.uni-duisburg-essen.de/~backhaus/pdfs_fuer_Webseite/PG_Schwungbewegungen.pdf>, Page 58

Simple pendulum calculator: <https://rechneronline.de/rad/pendel.php>

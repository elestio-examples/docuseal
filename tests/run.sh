#!/usr/bin/env bash
sed -i "s~FORCE_SSL: "true"~FORCE_SSL: false~g" ./docker-compose.yml
docker-compose up -d;
sleep 30s;

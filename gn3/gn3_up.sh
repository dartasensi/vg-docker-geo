#!/bin/bash
docker-compose up -d postgis
sleep 10s
docker-compose up -d geonetwork3

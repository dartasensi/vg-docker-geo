#!/bin/bash
GN_DATA_VOL=gn_data_persist_volume
GN_DB_VOL=gn_db_persist_volume
POSTGIS_VOL=postgis_persist_volume

docker volume create --name=${GN_DATA_VOL}
docker volume create --name=${GN_DB_VOL}
docker volume create --name=${POSTGIS_VOL}

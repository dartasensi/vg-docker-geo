#!/bin/bash
GN_DATA_VOL=gn_data_persist_volume
GN_DB_VOL=gn_db_persist_volume

docker volume create ${GN_DATA_VOL}
docker volume create ${GN_DB_VOL}
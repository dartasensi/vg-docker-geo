#!/bin/bash
#set -x

GN_DATA_VOL=gn_data_persist_volume
GN_H2_DB_VOL=gn_h2_db_persist_volume
POSTGIS_VOL=postgis_persist_volume

initializeVolume() {
  local res=1
  local inputVolumeName=$1

  echo
  echo "> Removing volume [${inputVolumeName}]"
  # if it is the first time, the removal will fail
  docker volume rm ${inputVolumeName}
  
  echo "> Creating volume [${inputVolumeName}]"
  docker volume create --name=${inputVolumeName}
  res=$?

  return ${res}
}

initVolumes() {
  local res=1
  local prevRes=1

  # proceed only if the previous command was successful
  initializeVolume ${POSTGIS_VOL}
  prevRes=$?

  if [ "${prevRes}" -eq 0 ] ; then
  	initializeVolume ${GN_DATA_VOL}
	prevRes=$?
  fi

  if [ "${prevRes}" -eq 0 ] ; then
	initializeVolume ${GN_H2_DB_VOL}
	prevRes=$?
  fi

  res=${prevRes}

  return ${res}
}

reviewAction() {
  local res=1
  local requireConfig=n

  echo
  echo "*** WARNING: this script execute a DESTRUCTIVE action on the specified docker volumes. ***"
  read -p "Do you want to continue? (y/n) " requireConfig

  case ${requireConfig:0:1} in
    y|Y )
      res=0
    ;;
    * )
      echo "Aborting..."
      res=1
    ;;
  esac

  return ${res}
}

execute() {
  local res=1

  reviewAction
  if [ "$?" -eq 0 ] ; then
    # proceed with the initialization of the docker volumes
	initializeVolume ${GN_DATA_VOL}
	initializeVolume ${GN_H2_DB_VOL}
	initializeVolume ${POSTGIS_VOL}
	res=$?
  else
    res=1
  fi

  return ${res}
}

# main
execute

exit $?
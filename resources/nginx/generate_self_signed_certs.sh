#!/bin/bash
# cmd found at https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-nginx-in-ubuntu-18-04

DST_KEY_ROOT_PATH=./ssl/private
DST_CERT_ROOT_PATH=./ssl/certs

if [[ -d "${DST_KEY_ROOT_PATH}" && -d "${DST_CERT_ROOT_PATH}" ]] ; then
  DST_KEY_PATH=$DST_KEY_ROOT_PATH/nginx-selfsigned.key
  DST_CERT_PATH=$DST_CERT_ROOT_PATH/nginx-selfsigned.crt

  echo "Building self-signed key and certificates:"
  echo " - key [${DST_KEY_PATH}]"
  echo " - cert [${DST_CERT_PATH}]"
  echo "Executing [openssl] command ..."
  sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $DST_KEY_PATH -out $DST_CERT_PATH
  echo "Executed with result $?"
fi

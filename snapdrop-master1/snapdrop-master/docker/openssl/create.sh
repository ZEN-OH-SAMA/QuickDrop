#!/bin/sh

cnf_dir='/mnt/openssl/'
certs_dir='/etc/ssl/certs/'
openssl req -config ${cnf_dir}quickdropCA.cnf -new -x509 -days 1 -keyout ${certs_dir}quickdropCA.key -out ${certs_dir}quickdropCA.crt
openssl req -config ${cnf_dir}quickdropCert.cnf -new -out /tmp/quickdrop-dev.csr -keyout ${certs_dir}quickdrop-dev.key
openssl x509 -req -in /tmp/quickdrop-dev.csr -CA ${certs_dir}quickdropCA.crt -CAkey ${certs_dir}quickdropCA.key -CAcreateserial -extensions req_ext -extfile ${cnf_dir}quickdropCert.cnf -sha512 -days 1 -out ${certs_dir}quickdrop-dev.crt

exec "$@"
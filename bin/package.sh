#!/bin/bash
rm /io/lambda.zip
rm -rf /io/pkg
mkdir -p /io/pkg/bin
mkdir -p /io/pkg/lib

cp ./bootstrap /io/pkg
cp ./function.sh /io/pkg/
cp /usr/bin/pg_dump /io/pkg/bin/pg_dump
cp /lib64/libpq.so.private15-5 /io/pkg/lib/
cp /lib64/libldap_r-2.4.so.2 /io/pkg/lib/
cp /lib64/liblber-2.4.so.2 /io/pkg/lib/
cp /usr/lib64/libsasl2.so.3 /io/pkg/lib/
cp /usr/lib64/libssl3.so /io/pkg/lib/
cp /usr/lib64/libcrypt.so.2 /io/pkg/lib/
# cp /usr/lib64/libsmime3.so /io/pkg/lib/
# cp /lib64/libnss3.so /io/pkg/lib/
# cp /lib64/libnssutil3.so /io/pkg/lib/
cd /io/pkg
zip -r /io/lambda.zip .

#mine

#!/usr/bin/env bash

cp /usr/bin/pg_dump /io/bin/pg_dump
cp /usr/lib64/libpq.so.5.9 /io/lib/libpq.so.5
zip -r /io/lambda.zip *

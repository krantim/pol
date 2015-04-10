#! /bin/bash

# This script is called by Jenkins like this:
# ./infrastructure/ansible/roles/fpm/files/${JOB_NAME##*/}/build.sh

PACKAGE_NAME=${JOB_NAME##*/}

sudo fpm -s dir \
    -t rpm \
    -a all \
    -n scb10x-${PACKAGE_NAME} \
    -v 1.0 \
    -C infrastructure/ansible/roles/fpm/files/${PACKAGE_NAME} \
    .

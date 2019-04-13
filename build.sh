#!/usr/bin/env bash

TOP=.

source ${TOP}/vars/build

docker build \
    --build-arg new_user=`whoami` \
    -t ${full_image_name}:${image_version} . 

docker tag ${full_image_name}:${image_version} ${full_image_name}:latest

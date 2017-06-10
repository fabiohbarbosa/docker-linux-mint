#!/bin/sh
image_name=fabiohbarbosa/linux-mint
image_version=18.2
docker build -t ${image_name}:${image_version}-ci .
docker run --rm -i -t ${image_name}:${image_version}-ci lsb_release -ca
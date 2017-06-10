#!/bin/sh
image_name=fabiohbarbosa/linux-mint
image_version=17.1

docker build -t ${image_name}:${image_version} .
docker run --rm -i -t ${image_name}:${image_version} lsb_release -ca
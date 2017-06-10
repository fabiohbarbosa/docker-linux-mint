#!/bin/sh
image_name=fabiohbarbosa/linux-mint:18.2
docker run --rm -i -t ${image_name} lsb_release -ca
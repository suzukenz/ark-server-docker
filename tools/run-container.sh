#!/bin/bash
VOLUME_NAME=ark-data
IMAGE_NAME=suzukenz/ark

docker run -d \
  -p 7777:7777/udp \
  -p 7778:7778/udp \
  -p 27015:27015/udp \
  -v ${VOLUME_NAME}:/ark \
  --name ark \
  --rm \
  ${IMAGE_NAME}

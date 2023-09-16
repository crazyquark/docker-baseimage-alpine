#!/bin/bash

echo 'Patching dockerfile...'
rm -f Dockerfile.armhf
cp Dockerfile.aarch64 Dockerfile.armhf

sed -i 's/aarch64/armhf/g' Dockerfile.armhf
sed -i 's/REL=v3.18/REL=edge/g' Dockerfile.armhf
diff Dockerfile.aarch64 Dockerfile.armhf

echo 'Building image & pushing'
docker build -f Dockerfile.armhf -t crazyquark/baseimage-alpine:armhf-edge .
docker push crazyquark/baseimage-alpine:armhf-edge

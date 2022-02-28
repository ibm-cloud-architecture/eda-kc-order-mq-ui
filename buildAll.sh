#!/bin/bash
scriptDir=$(dirname $0)
IMAGE_NAME=quay.io/ibmcase/eda-kc-order-mq-ui
TAG=latest
yarn build
docker build -f Dockerfile -t ${IMAGE_NAME}:${TAG} .
docker push ${IMAGE_NAME}:${TAG}


SHELL:=/bin/bash

GTSAM_IMAGE_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
IMAGE_TAG?=pvphan/gtsam-image:4.1.1

shell: image
	docker run --rm -it ${IMAGE_TAG} bash

image:
	docker build --tag ${IMAGE_TAG} ${GTSAM_IMAGE_DIR}

uploadImage: image
	docker push ${IMAGE_TAG}

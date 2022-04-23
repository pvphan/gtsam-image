
SHELL:=/bin/bash

GTSAM_IMAGE_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
IMAGE_TAG?=pvphan/gtsam-image:4.1.1

shell: image
	docker run --rm -it ${IMAGE_TAG} bash

image:
	echo "${GTSAM_IMAGE_DIR}/Dockerfile"
	docker build --file ${GTSAM_IMAGE_DIR}/Dockerfile --tag ${IMAGE_TAG} .

uploadImage: image
	docker push ${IMAGE_TAG}

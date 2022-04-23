
SHELL:=/bin/bash

#CWD:=$(dir $(abspath $(firstword $(MAKEFILE_LIST))))
CWD:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
IMAGE_TAG?=pvphan/gtsam-image:4.1.1

shell: image
	docker run --rm -it ${IMAGE_TAG} bash

image:
	echo ${CWD}
	docker build --tag ${IMAGE_TAG} ${CWD}

uploadImage: image
	docker push ${IMAGE_TAG}

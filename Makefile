
SHELL:=/bin/bash

BRANCH:=$(shell git branch --show-current)
IMAGE_TAG?=pvphan/gtsam-image:4.1rc

image:
	docker build --tag ${IMAGE_TAG} .

uploadImage: image
	docker push ${IMAGE_TAG}

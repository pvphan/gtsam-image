
SHELL:=/bin/bash

BRANCH:=$(shell git branch --show-current)
ROS_IMAGE_VERSION?=python3-gtsam-${BRANCH}
ROS_IMAGE_TAG?=pvphan/gtsam-image:${ROS_IMAGE_VERSION}

image:
	docker build --tag ${ROS_IMAGE_TAG} .

uploadImage: image
	docker push ${ROS_IMAGE_TAG}

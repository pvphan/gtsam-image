
SHELL:=/bin/bash

BRANCH:=$(shell git branch --show-current)
ROS_IMAGE_TAG?=pvphan/gtsam-image:4.1rc

image:
	docker build --tag ${ROS_IMAGE_TAG} .

uploadImage: image
	docker push ${ROS_IMAGE_TAG}

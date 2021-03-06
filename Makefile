
SHELL:=/bin/bash

BRANCH:=$(shell git branch --show-current)
IMAGE_TAG?=pvphan/gtsam-image:4.1rc

shell: image
	docker run --rm -it ${IMAGE_TAG} bash

image:
	docker build --tag ${IMAGE_TAG} .

uploadImage: image
	docker push ${IMAGE_TAG}

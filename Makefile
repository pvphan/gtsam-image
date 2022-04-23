
SHELL:=/bin/bash

IMAGE_TAG?=pvphan/gtsam-image:4.1.1

shell: image
	docker run --rm -it ${IMAGE_TAG} bash

image:
	docker build --tag ${IMAGE_TAG} .

uploadImage: image
	docker push ${IMAGE_TAG}

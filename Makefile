
SHELL:=/bin/bash

GTSAM_IMAGE_TAG:=pvphan/gtsam-image:4.1.1

shell: image
	docker run --rm -it ${GTSAM_IMAGE_TAG} bash

image:
	docker build --tag ${GTSAM_IMAGE_TAG} .

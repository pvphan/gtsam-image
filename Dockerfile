FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev ffmpeg libsm6 libxext6 \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

RUN pip3 install gtsam==4.1.0 opencv-contrib-python==4.5.1.48

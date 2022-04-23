FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

WORKDIR /tmp
RUN apt-get update -y && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        g++ \
        make \
        cmake \
        libboost-all-dev \
        libeigen3-dev \
        git \
        apt-transport-https ca-certificates \
        && update-ca-certificates

RUN git clone https://github.com/borglab/gtsam.git && cd gtsam && git checkout 4.1.1 && \
        cd /tmp/gtsam && \
        mkdir build && \
        cd build && \
        cmake -D GTSAM_USE_QUATERNIONS=ON \
                -D GTSAM_USE_SYSTEM_EIGEN=ON \
                -D CMAKE_INSTALL_PREFIX=/usr/local \
                -D CMAKE_BUILD_TYPE=Release \
                -D GTSAM_WITH_TBB=ON \
                .. && \
        make -j install && \
        rm -rf /tmp/gtsam

RUN apt-get update \
        && apt-get install -y python3-pip python3-dev ffmpeg libsm6 libxext6 \
        && cd /usr/local/bin \
        && ln -s /usr/bin/python3 python \
        && pip3 install --upgrade pip

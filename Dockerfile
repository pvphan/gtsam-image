FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev git \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

# gtsam dependencies
RUN apt-get install -y cmake libtbb-dev libboost-all-dev libatlas-base-dev
RUN pip3 install cython

RUN cd /tmp \
  && git clone https://github.com/borglab/gtsam.git \
  && cd gtsam \
  && git config --global advice.detachedHead false \
  && git checkout "4.1rc" \
  && mkdir build \
  && cd build \
  && cmake \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D GTSAM_BUILD_UNSTABLE=OFF \
    -D GTSAM_USE_QUATERNIONS=ON \
    -D GTSAM_INSTALL_CYTHON_TOOLBOX=ON \
    .. \
  && make \
  && make install \
  && ldconfig \
  && cd python \
  && python setup.py install

FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

# python 3
RUN apt update \
  && apt install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

## gtsam dependencies
#RUN apt install -y cmake libtbb-dev libboost-all-dev libatlas-base-dev
#
#RUN pip3 install cython
#
#RUN mkdir ~/git \
#    && cd ~/git \
#    && git clone https://github.com/borglab/gtsam.git \
#    && cd gtsam \
#    && mkdir build \
#    && cd build \
#    && cmake \
#        -D CMAKE_BUILD_TYPE=Release \
#        -D CMAKE_INSTALL_PREFIX=/usr/local \
#        -D GTSAM_CMAKE_BUILD_TYPE=Release \
#        -D GTSAM_BUILD_UNSTABLE=OFF \
#        -D GTSAM_USE_QUATERNIONS=ON \
#        -D GTSAM_INSTALL_CYTHON_TOOLBOX=ON \
#        -D GTSAM_CMAKE_CXX_FLAGS="-march=native -std=c++11 -Wall" \
#        .. \
#    && make -j8
#    && make check
#    && sudo make install
#    && sudo ldconfig
#    && cd cython
#    && python setup.py install

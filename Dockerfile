FROM resin/aarch64-ubuntu:bionic

RUN [ "cross-build-start" ]

RUN apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y 
	build-essential \
	autoconf \
	less \
	libtinyxml2-dev \
	libopencv-dev \
	libgstreamer1.0-dev \
	libgstreamer-plugins-base1.0-dev \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

ADD pylon_5.1.0.12682-deb0_arm64.deb /
RUN dpkg -i /pylon_5.1.0.12682-deb0_arm64.deb

RUN useradd -ms /bin/bash appuser

RUN [ "cross-build-end" ]

USER appuser

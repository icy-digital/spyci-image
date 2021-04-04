ARG DEBIAN_FRONTEND=noninteractive
FROM ubuntu:20.04

RUN apt-get -y upgrade && \
    apt-get -y update && \
    apt-get -y -q install \
    tzdata

RUN apt-get -y -q install \
    git \
    cmake \
    pkg-config \
    libssl-dev \
    libcurl4-openssl-dev \
    liblog4cplus-dev \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    gstreamer1.0-plugins-base-apps \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-tools && \
    rm -rf /var/lib/apt/lists/*

# ===== Setup WebRTC Producer SDK (C) =======================================
WORKDIR /opt/
RUN git clone --recursive https://github.com/awslabs/amazon-kinesis-video-streams-webrtc-sdk-c.git
WORKDIR /opt/amazon-kinesis-video-streams-webrtc-sdk-c/build/
RUN cmake .. -DBUILD_STATIC_LIBS=TRUE && \
    make

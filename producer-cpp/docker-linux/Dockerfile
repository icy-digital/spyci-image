ARG DEBIAN_FRONTEND=noninteractive
FROM ubuntu:20.04

RUN apt-get upgrade && \
    apt-get update && \
    apt-get install -y \
    libssl-dev \
    libcurl4-openssl-dev \
    liblog4cplus-dev \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    gstreamer1.0-plugins-base-apps \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-tools \
    pkg-config \
    cmake \
    m4

# ===== Setup Kinesis Video Streams Producer SDK (CPP) =======================================
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64/

WORKDIR /opt/

RUN git clone https://github.com/awslabs/amazon-kinesis-video-streams-producer-sdk-cpp.git
WORKDIR /opt/amazon-kinesis-video-streams-producer-sdk-cpp/build/
RUN cmake .. -DBUILD_GSTREAMER_PLUGIN=ON &&\
    make

ENV LD_LIBRARY_PATH=/opt/amazon-kinesis-video-streams-producer-sdk-cpp/open-source/local/lib:$LD_LIBRARY_PATH
ENV GST_PLUGIN_PATH=/opt/amazon-kinesis-video-streams-producer-sdk-cpp/build

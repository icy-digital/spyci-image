FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get install \
    libssl-dev \
    libcurl4-openssl-dev \
    liblog4cplus-dev \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    gstreamer1.0-plugins-base-apps \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-tools

# ===== Setup Kinesis Video Streams Producer SDK (CPP) =======================================
RUN git clone https://github.com/awslabs/amazon-kinesis-video-streams-producer-sdk-cpp.git
WORKDIR /amazon-kinesis-video-streams-producer-sdk-cpp/build/
RUN cmake -DBUILD_GSTREAMER_PLUGIN && \
    make

export GST_PLUGIN_PATH=/amazon-kinesis-video-streams-producer-sdk-cpp/build
export LD_LIBRARY_PATH=/amazon-kinesis-video-streams-producer-sdk-cpp/open-source/local/lib

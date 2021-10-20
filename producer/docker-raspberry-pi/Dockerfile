ARG DEBIAN_FRONTEND=noninteractive
FROM balenalib/raspberrypi3-64:stretch

RUN apt-get -y -q install \
    apt-utils \
    tzdata \
	&& rm -rf /var/lib/apt/lists/*

RUN apt-get -y -q install \
    cmake

WORKDIR /opt/
RUN git clone https://github.com/awslabs/amazon-kinesis-video-streams-producer-sdk-cpp.git
WORKDIR /opt/amazon-kinesis-video-streams-producer-sdk-cpp/build/
RUN cmake .. -DBUILD_GSTREAMER_PLUGIN=ON -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -DBUILD_OPENSSL_PLATFORM=linux-armv4 && \
	make

ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-armhf/
ENV LD_LIBRARY_PATH=/opt/amazon-kinesis-video-streams-producer-sdk-cpp/open-source/local/lib
ENV GST_PLUGIN_PATH=/opt/amazon-kinesis-video-streams-producer-sdk-cpp/build/:$GST_PLUGIN_PATH

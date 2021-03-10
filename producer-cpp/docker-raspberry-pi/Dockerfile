ARG DEBIAN_FRONTEND=noninteractive
FROM balenalib/raspberrypi3-64:latest

RUN apt-get upgrade && \
    apt-get update && \
    apt-get -y -q install \
    apt-utils \
    tzdata

RUN apt-get upgrade && \
		apt-get update && \
		apt-get -y -q install \
		cmake \
		curl \
		g++ \
		gcc \
		git \
		gstreamer1.0-plugins-base-apps \
		gstreamer1.0-plugins-bad \
		gstreamer1.0-plugins-good \
		gstreamer1.0-plugins-ugly \
		gstreamer1.0-tools \
		gstreamer1.0-omx \
		libssl-dev \
		libcurl4-openssl-dev \
		liblog4cplus-dev \
		libgstreamer1.0-dev \
		libgstreamer-plugins-base1.0-dev \
		m4 \
		make \
		openssh-server \
		pkg-config \
		vim


RUN     ln -s /opt/vc/lib/libopenmaxil.so /usr/lib/libopenmaxil.so && \
        ln -s /opt/vc/lib/libbcm_host.so /usr/lib/libbcm_host.so && \
        ln -s /opt/vc/lib/libvcos.so /usr/lib/libvcos.so &&  \
        ln -s /opt/vc/lib/libvchiq_arm.so /usr/lib/libvchiq_arm.so && \
        ln -s /opt/vc/lib/libbrcmGLESv2.so /usr/lib/libbrcmGLESv2.so && \
        ln -s /opt/vc/lib/libbrcmEGL.so /usr/lib/libbrcmEGL.so && \
        ln -s /opt/vc/lib/libGLESv2.so /usr/lib/libGLESv2.so && \
        ln -s /opt/vc/lib/libEGL.so /usr/lib/libEGL.so

WORKDIR /opt/
RUN	git clone https://github.com/awslabs/amazon-kinesis-video-streams-producer-sdk-cpp.git
WORKDIR /opt/amazon-kinesis-video-streams-producer-sdk-cpp/build/
RUN cmake .. -DBUILD_GSTREAMER_PLUGIN=ON -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -DBUILD_OPENSSL_PLATFORM=linux-armv4 && \
	make

ENV LD_LIBRARY_PATH=/opt/amazon-kinesis-video-streams-producer-sdk-cpp/open-source/local/lib
ENV GST_PLUGIN_PATH=/opt/amazon-kinesis-video-streams-producer-sdk-cpp/build/:$GST_PLUGIN_PATH

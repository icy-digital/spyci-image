ARG DEBIAN_FRONTEND=noninteractive
FROM balenalib/raspberrypi3-64:latest

RUN apt-get-upgrade && \
		apt-get update && \
		apt-get install -y \
		cmake \
		git \
		byacc \
		flex \
		openjdk-8-jdk

ENV JAVA_HOME=JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-armhf/

WORKDIR /opt/
RUN	git clone https://github.com/awslabs/amazon-kinesis-video-streams-producer-sdk-cpp.git
WORKDIR /opt/amazon-kinesis-video-streams-producer-sdk-cpp/build/

RUN cmake .. && \
	make

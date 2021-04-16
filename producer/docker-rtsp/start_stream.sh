#!/bin/bash

# cd /opt/amazon-kinesis-video-streams-producer-sdk-cpp/build/

export GST_PLUGIN_PATH=/opt/amazon-kinesis-video-streams-producer-sdk-cpp/build
export LD_LIBRARY_PATH=/opt/amazon-kinesis-video-streams-producer-sdk-cpp/open-source/local/lib

gst-launch-1.0 v4l2src do-timestamp=TRUE device=/dev/video0 ! videoconvert \
# ! video/x-raw,format=I420,width=640,height=480,framerate=30/1 \
! <b>nvvidconv ! 'video/x-raw(memory:NVMM),format=NV12'</b> ! omxh264enc \
control-rate=2 target-bitrate=512000 inline-header=FALSE periodicty-idr=20 ! \
h264parse ! video/x-h264,stream-format=avc,alignment=au,width=640,height=480,framerate=30/1,profile=baseline ! \
kvssink stream-name=$STREAM_NAME access-key=$AWS_ACCESS_KEY_ID secret-key=$AWS_SECRET_ACCESS_KEY aws-region=$AWS_REGION

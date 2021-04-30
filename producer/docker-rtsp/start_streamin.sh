#!/bin/bash

# cd /opt/amazon-kinesis-video-streams-producer-sdk-cpp/build/
STREAM_NAME=$1
AWS_ACCESS_KEY_ID=$2
AWS_SECRET_ACCESS_KEY=$3
AWS_REGION=$4

export GST_PLUGIN_PATH=/opt/amazon-kinesis-video-streams-producer-sdk-cpp/build
export LD_LIBRARY_PATH=/opt/amazon-kinesis-video-streams-producer-sdk-cpp/open-source/local/lib

gst-launch-1.0 \
v4l2src do-timestamp=TRUE device=/dev/video0 \
! videoconvert \
! video/x-raw,format=I420,width=640,height=480,framerate=30/1 \
! x264enc bframes=0 key-int-max=45 bitrate=500 \
! video/x-h264,stream-format=avc,alignment=au,width=640,height=480,framerate=30/1,profile=baseline \
! kvssink stream-name=$STREAM_NAME access-key=$AWS_ACCESS_KEY_ID secret-key=$AWS_SECRET_ACCESS_KEY aws-region=$AWS_REGION

# gst-launch-1.0 \ launches gstreamer1
# v4l2src do-timestamp=TRUE device=/dev/video0 \
# ! videoconvert \
# ! video/x-raw,format=I420,width=640,height=480,framerate=30/1 \
# ! omxh264enc control-rate=2 target-bitrate=512000 inline-header=FALSE periodicty-idr=20 \
# ! h264parse \
# ! video/x-h264,stream-format=avc,alignment=au,width=640,height=480,framerate=30/1,profile=baseline \
# ! kvssink stream-name=$STREAM_NAME access-key=$AWS_ACCESS_KEY_ID secret-key=$AWS_SECRET_ACCESS_KEY aws-region=$AWS_REGION

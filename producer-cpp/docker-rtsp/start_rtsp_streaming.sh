#!/bin/bash

# cd /opt/amazon-kinesis-video-streams-producer-sdk-cpp/build/

export GST_PLUGIN_PATH=/opt/amazon-kinesis-video-streams-producer-sdk-cpp/build
export LD_LIBRARY_PATH=/opt/amazon-kinesis-video-streams-producer-sdk-cpp/open-source/local/lib

gst-launch-1.0 v4l2src do-timestamp=TRUE device=/dev/video0 ! videoconvert \
! video/x-raw,format=I420,width=640,height=480,framerate=30/1 ! omxh264enc \
control-rate=2 target-bitrate=512000 inline-header=FALSE periodicty-idr=20 ! \
h264parse ! video/x-h264,stream-format=avc,alignment=au,width=640,height=480,framerate=30/1,profile=baseline ! \
kvssink stream-name="YOURSTREAMNAME" access-key=YOURACCESSKEY secret-key=YOURSECRETKEY

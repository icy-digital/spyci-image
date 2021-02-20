#!/bin/bash

cd /opt/amazon-kinesis-video-streams-producer-sdk-cpp/build/

# Start the demo rtsp application to send video streams
gst-launch-1.0 rtspsrc location=$RTSP_URL short-header=TRUE ! rtph264depay ! video/x-h\
264, width=640,height=480,framerate=15/1, format=avc,alignment=au ! kvssink stream-name=$STREAM_NAME \
storage-size=512 access-key=$AWS_ACCESS_KEY_ID secret-key=$AWS_SECRET_ACCESS_KEY

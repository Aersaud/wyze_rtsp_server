#!/bin/sh

echo "Starting ffmpeg"
ffmpeg \
-buffer_size 500 \
-use_wallclock_as_timestamps 1 \
-rtsp_transport tcp \
-i "rtsp://USERNAME:PASSWORD@IP_ADDRESS:8554/unicast" \
-c:v copy \
-c:a libfdk_aac \
-b:a 96k \
-f rtsp rtsp://rtsp-simple-server:8554/PATH \
2> /tmp/ffmpeg.log

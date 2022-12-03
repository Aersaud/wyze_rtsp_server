1. Install wz_mini_hacks from https://github.com/gtxaspec/wz_mini_hacks
2. Edit the wz_mini.conf to your liking. Settings that I have tested are below:
```
#####VIDEO STREAM#####
RTSP_LOGIN="admin"
RTSP_PASSWORD="PASSWORD" #replace with password of your choice
RTSP_PORT="8554"

RTSP_HI_RES_ENABLED="true"
RTSP_HI_RES_ENABLE_AUDIO="true"
RTSP_HI_RES_FPS=""
RTSP_HI_RES_MAX_BITRATE="51200"
RTSP_HI_RES_TARGET_BITRATE="2048"
RTSP_HI_RES_ENC_PARAMETER="8"
```
3. Edit rtsp-simple-server.yml and add your path at the bottom. Follow the example for formatting.
4. Edit ffmpeg-start.sh and replace USERNAME PASSWORD and IP_ADDRESS with your camera's RTSP stream.
5. Run `docker-compose up -d` it will build the ffmpeg-watcher Dockerfile and bring up both containers.

If you are using Scrypted to import the stream into Homekit you will be importing the rtsp-simple-server stream. I am using the RTSP Camera Plugin in Scrypted.
So for example my rtsp-simple-server is pushing out a stream on `rtsp://172.30.1.90:8554/example`
Do note that your path and local IP address may be different. The port 8554 is the default port for the Live555 RTSP stream when using wz_mini_hacks.

#!/bin/sh

/tmp/ffmpeg-start.sh &
sleep 10
while true
do
    frameA=$(tail /tmp/ffmpeg.log -n 1 | sed -nr 's/.*frame=(.*)fps.*/\1/p')
#    echo "$frameA"
    sleep 5
    frameB=$(tail /tmp/ffmpeg.log -n 1 | sed -nr 's/.*frame=(.*)fps.*/\1/p')
#    echo "$frameB"

    if [ "$frameA" = "$frameB" ]
    then
        echo "Stream has hung"
        printf "%s - Stream has hung\n" "$(date)" >> /dev/stdout
        pkill ffmpeg
        echo "Killed ffmpeg..."
        printf "%s - Killed ffmpeg...\n" "$(date)" >> /dev/stdout
        echo "Waiting 5 secs"
        sleep 5
        /tmp/ffmpeg-start.sh &
        echo "Started ffpmeg.."
        printf "%s - Started ffmpeg..\n" "$(date)" >> /dev/stdout
        echo "Waiting 15 secs"
        sleep 15
    else
        printf "%s - Stream is running" >> /dev/stdout
    fi

    sleep 2
done

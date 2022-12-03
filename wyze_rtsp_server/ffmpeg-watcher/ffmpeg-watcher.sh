#!/bin/sh

/tmp/ffmpeg-start.sh &
sleep 10
x=0
while true
do
    frameA=$(tail /tmp/ffmpeg.log -n 1 | sed -nr 's/.*frame=(.*)fps.*/\1/p')
#    echo "$frameA"
    sleep 5
    frameB=$(tail /tmp/ffmpeg.log -n 1 | sed -nr 's/.*frame=(.*)fps.*/\1/p')
#    echo "$frameB"

    if [ "$frameA" = "$frameB" ]
    then
        x=0
        echo "Stream has hung."
        pkill ffmpeg
        echo "Killed ffmpeg.."
        echo "Waiting 5 secs before restarting..."
        sleep 5
        /tmp/ffmpeg-start.sh &
        echo "Started ffpmeg.."
        echo "Waiting 15 secs before rechecking..."
        sleep 15
    else
       if [ $x -eq 0 ]
       then
        echo "Stream is running..."
        x=1
       else
           :
       fi
    fi

    sleep 2
done

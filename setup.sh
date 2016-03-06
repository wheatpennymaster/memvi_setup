#!/bin/bash

$BASE_FEEDS=/etc/opkg/base-feeds.conf

echo "$BASE_FEEDS" >> "src/gz all http://repo.opkg.net/edison/repo/all"
echo "$BASE_FEEDS" >> "src/gz edison http://repo.opkg.net/edison/repo/edison"
echo "$BASE_FEEDS" >> "src/gz core2-32 http://repo.opkg.net/edison/repo/core2-32"

opkg update
opkg install git
mkdir YesFiles
mkdir NoFiles
mkdir Videos
mkdir 9DOF_folder
mkdir sparkfunadc
git clone https://github.com/flowthings/sparkfunAdc.git
install -g sparkfunadc/

#setup FFMPEG
echo "Please plug in camera"
OUTPUT=`lsusb`
while [ -n "$OUTPUT" ]
do
	echo "not connected..."
	sleep 5
done
$DEV_VIDEO_s = "/dev/video0"
DEV_VIDEO_e=`/dev/video0`
if [ "$DEV_VIDEO_s" != "$DEV_VIDEO_e" ]
	echo "DEV0 error"
	exit
fi
git clone https://github.com/drejkim/edi-cam.git
/home/root/edi-cam/bin/install_ffmpeg.sh
/home/root/bin/ffmpeg/ffmpeg -f alsa -thread_queue_size 32768 -itsoffset -0.8 -ac 1 -t 15.8 -i hw:2 -f video4linux2 -thread_queue_size 8388608  -itsoffset 00:00 -s hd480  -t 15 -i /dev/video0 -b:v 1M -c:v libxvid -vsync cfr /home/root/Videos/test.avi


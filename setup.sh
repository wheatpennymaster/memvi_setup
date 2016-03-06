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


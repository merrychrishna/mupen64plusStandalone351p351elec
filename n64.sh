#!/bin/bash

if [[ $3 == "mupen64plus-sa-rice" ]]; then
LD_LIBRARY_PATH=/usr/lib32:/storage/opt/mupen64plus/lib32 /storage/opt/mupen64plus/mupen64plus --resolution 480x320 --plugindir /storage/opt/mupen64plus --gfx mupen64plus-video-rice.so --corelib /storage/opt/mupen64plus/libmupen64plus.so.2 --datadir /storage/opt/mupen64plus "$1"
elif [[ $3 == "mupen64plus-sa-glide64mk" ]]; then
LD_LIBRARY_PATH=/usr/lib32:/storage/opt/mupen64plus/lib32 /storage/opt/mupen64plus/mupen64plus --resolution 480x320 --plugindir /storage/opt/mupen64plus --gfx mupen64plus-video-glide64mk2.so --corelib /storage/opt/mupen64plus/libmupen64plus.so.2 --datadir /storage/opt/mupen64plus "$1"

else
/usr/bin/runemu.sh "$1" -P"$2" --emulator=$3 --core=$4 --controllers="$5"
fi













#if [[ $3 == "standalone-Rice" ]]; then
#LD_LIBRARY_PATH=/usr/lib32:/storage/opt/mupen64plus/lib32 /storage/opt/mupen64plus/mupen64plus --resolution 480x320 --plugindir /storage/opt/mupen64plus --gfx mupen64plus-video-rice.so --corelib /storage/opt/mupen64plus/libmupen64plus.so.2 --datadir /storage/opt/mupen64plus "$1"
#elif [[ $3 == "standalone-Glide64mk2" ]]; then
#LD_LIBRARY_PATH=/usr/lib32:/storage/opt/mupen64plus/lib32 /storage/opt/mupen64plus/mupen64plus --resolution 480x320 --plugindir /storage/opt/mupen64plus --gfx mupen64plus-video-glide64mk2.so --corelib /storage/opt/mupen64plus/libmupen64plus.so.2 --datadir /storage/opt/mupen64plus "$1"

#elif [[ $4 == "standalone-Rice" ]]; then
#LD_LIBRARY_PATH=/usr/lib32:/storage/opt/mupen64plus/lib32 /storage/opt/mupen64plus/mupen64plus --resolution 480x320 --plugindir /storage/opt/mupen64plus --gfx mupen64plus-video-rice.so --corelib /storage/opt/mupen64plus/libmupen64plus.so.2 --datadir /storage/opt/mupen64plus "$1"
#elif [[ $4 == "standalone-Glide64mk2" ]]; then
#LD_LIBRARY_PATH=/usr/lib32:/storage/opt/mupen64plus/lib32 /storage/opt/mupen64plus/mupen64plus --resolution 480x320 --plugindir /storage/opt/mupen64plus --gfx mupen64plus-video-glide64mk2.so --corelib /storage/opt/mupen64plus/libmupen64plus.so.2 --datadir /storage/opt/mupen64plus "$1"



#elif [[ $4 == "libretro" ]]; then
#/usr/bin/runemu.sh "$1" -P"$2" --emulator=$3 --core=$4 --controllers="$5"
#elif [[ $4 == "retrorun" ]]; then
#/usr/bin/runemu.sh "$1" -P"$2" --emulator=$3 --core=$4 --controllers="$5"

#elif [[ $3 == "libretro" ]]; then
#/usr/bin/runemu.sh "$1" -P"$2" --emulator=$3 --core=$4 --controllers="$5"
#elif [[ $3 == "retrorun" ]]; then
#/usr/bin/runemu.sh "$1" -P"$2" --emulator=$3  --core=$4 --controllers="$5"

#else
#/usr/bin/runemu.sh "$1" -P"$2" --emulator=$3 --core=$4 --controllers="$5"
#fi

#!/bin/bash

PATTERN_NUM=$1
CONTAINER_NUM1=$2
CONTAINER_NUM2=$3

CONTAINER_IP1="172.17.4.17:2121"
CONTAINER_IP2="172.17.4.17"

if [ $CONTAINER_NUM1 = "1" ]; then
  SERVER_IP1=$CONTAINER_IP1
else
  SERVER_IP1=$CONTAINER_IP2
fi

if [ $CONTAINER_NUM2 = "1" ]; then
  SERVER_IP2=$CONTAINER_IP1
else
  SERVER_IP2=$CONTAINER_IP2
fi

## 1st download movie
read -p "Input Enter button to download 1st movie>"

START=$(date "+%Y%m%d,%H:%M:%S,%N")
lftp -c "open ftp://ubuntu:aabbccdd@$SERVER_IP1 ; get sample$CONTAINER_NUM1.mp4"
END=$(date "+%Y%m%d,%H:%M:%S,%N")
echo "$START,$END" >> pattern$PATTERN_NUM.csv

MOVIE_NAME1="p"$PATTERN_NUM"_$(date "+%Y%m%d_%H%M%S").mp4"
mv "sample$CONTAINER_NUM1.mp4" $MOVIE_NAME1
echo "Finish 1st Downloading."
open -a vlc $MOVIE_NAME1 # For mac PC

## 2nd download movie
read -p "Input Enter button to download 2nd movie>"

START=$(date "+%Y%m%d,%H:%M:%S,%N")
lftp -c "open ftp://ubuntu:aabbccdd@$SERVER_IP2 ; get sample$CONTAINER_NUM2.mp4"
END=$(date "+%Y%m%d,%H:%M:%S,%N")
echo "$START,$END" >> pattern$PATTERN_NUM.csv

MOVIE_NAME2="p"$PATTERN_NUM"_$(date "+%Y%m%d_%H%M%S").mp4"
mv "sample$CONTAINER_NUM2.mp4" $MOVIE_NAME2
echo "Finish 2nd Downloading."
open -a vlc $MOVIE_NAME2 # For mac PC

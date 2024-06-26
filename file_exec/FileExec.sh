#!/bin/bash

#如果文件存在且为空,-s代表存在不为空,!将他取反
if [[ ! -s filename ]]; then
  ok
fi

#判断文件是否存在
[ -f hello.txt ] && echo yes || echo no

FILE=/root/hello.txt
#判断文件是否存在
if ! [ -f $FILE ]; then
  #输出文件不存在
  echo “file not exist!”
  exit 1
fi
#判断文件大小，ls -l 用awk取输出的第五列
if [ ls -l $FILE | awk '{print $5}' -gt $((1024 * 1024)) ]; then
  #输出空到文件中
  echo "$(ls -l $FILE)" 
fi

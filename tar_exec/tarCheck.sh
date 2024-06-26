#!/bin/bash

#使用zcat命令加wc -l，查看.gz压缩包内的所有文件行数：
zcat 123.gz|wc -l

#使用tar tvf命令查看经过tar和gz双重压缩的文件列表：
tar tvf TF_mouse.tar.gz

如果想看压缩包里有多少份文件，可以这样：
#首先使用tar tvf将打印的文件列表输出到另一个文件中，这样这个文件就存储了压缩包内文件的所有目录

tar tvf /umac/tf/cistrome/histone_human.tar.gz > histone_human_list.out

#然后使用wc -l查看目录的行数，即可知道压缩包内有多少份文件了
wc -l histone_human_list.out

#查看文件夹下的文件数：
ls -l |grep “^-”|wc -l

#echo "this will not pass the test" > hello.tgz
tar -xvzf hello.tgz -O > /dev/null
#gzip: stdin: not in gzip format
#tar: Child returned status 1
#tar: Error exit delayed from previous errors

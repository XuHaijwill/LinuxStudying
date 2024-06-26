#!/bin/bash

#https://blog.csdn.net/love__coder/article/details/7218299
#假设我们压缩文件文件aaa.log 为aaa.log.tar.gz ，归档压缩之后，并删除文件aaa.log。请参阅下面的命令：
#可以看出，主要是使用了--remove-files 这个命令参数选项。
tar -zcvf aaa.log.tar.gz aaa.log --remove-files

#tar -zxvf aaa.txt.tar.gz && rm -rf aaa.txt.tar.gz
#对于上面两种应用，是不是可以进一步拓展出以下两种比较有实际意义的应用：
#遍历压缩归档日志文件：
find . -name "*.log" -type f -exec tar -zcvf {}.tar.gz {} --remove-files > /dev/null \;
#遍历解压tar.gz文件，并删除tar.gz文件
find . -name "*.tar.gz" -type f -exec tar -zxvf {}  \; -exec  rm -rf {}  \; > /dev/null


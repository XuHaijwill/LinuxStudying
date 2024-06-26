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

#Logical shell tool
# 首先判断输入参数个数是否为1
if [ $# -ne 1 ]
then
        echo "参数个数错误！应该输入一个参数，作为归档目录名"
        exit
fi

# 从输入参数中获取目录名称
if [ -d $1 ]
then
        echo
else
        echo
        echo "目录不存在"
        exit
fi

DIR_NAME=$(basename $1)
DIR_PATH=$(cd $(dirname $1); pwd)

# 获取当前日期
DATE=$(date +%y%m%d)

#定义生成的归档文件名称
FILE_NAME=archive_${DIR_NAME}_$DATE.tar.gz
DEST=/root/archive/$FILE_NAME


#开始归档目录文件

echo "开始归档..."
echo

tar -czf $DEST $DIR_PATH/$DIR_NAME

if [ $? -eq 0 ]
then
        echo
        echo "归档成功！"
        echo "归档文件为：$DEST"
else
        echo "归档出现问题！"
        echo
fi
exit


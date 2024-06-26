#!/bin/bash
# https://blog.csdn.net/love__coder/article/details/7028714
#find是个使用频率比较高的命令。常常用它在系统特定目录下，查找具有某种特征【名字类型属主权限等】的文件。
#find命令的格式： find  [-path ..] -options [-print -exec -ok]

#path：要查找的目录路径。
#~ 表示$HOME目录
#. 表示当前目录
#/ 表示根目录
#-print ：表示将结果输出到标准输出
#-exec ：对匹配的文件执行该参数所给出的shell命令。形式为 command  {} \; ，注意{}与\; 之间有空格
#-ok ：与-exec作用相同，区别在于，在执行命令之前，都会给出提示，让用户确认是否执行

#options常用的有下选项：
#-name 按照名字查找
#-perm 安装权限查找
#-prune 不再当前指定的目录下查找
#-user 文件属主来查找
#-group 所属组来查找
#-nogroup 查找无有效所属组的文件
#-nouser 查找无有效属主的文件
#-type 按照文件类型查找

#1、按名字查找
#
#在当前目录及子目录中，查找大写字母开头的txt文件
find . -name '[A-Z]*.txt' -print
#在/etc及其子目录中，查找host开头的文件
find /etc -name 'host*' -print

#在$HOME目录及其子目录中，查找所有文件
find ~ -name '*' -print
#在当前目录及子目录中，查找不是out开头的txt文件
find . -name "out*" -prune -o -name "*.txt" -print

#在当前目录除aa之外的子目录内搜索 txt文件
find . -path "./aa" -prune -o -name "*.txt" -print

#在当前目录除aa之外的子目录内搜索 txt文件
find . -path "./aa" -prune -o -name "*.txt" -print

#在当前目录及除aa和bb之外的子目录中查找txt文件
find . \( -path "./aa" -o -path "./bb" \) -prune -o -name "*.txt" -print

#在当前目录，不再子目录中，查找txt文件
find .  ! -name "." -type d -prune -o -type f -name "*.txt" -print

#在当前目录及子目录中，查找属主具有读写执行，其他具有读执行权限的文件
find . -perm 755 -print

#在当前目录及子目录下，查找符号链接文件
find . -type l -print

#查找属主是www的文件
find / -user www -type f -print

#查找属主被删除的文件
find /  -nouser -type f -print

#查找 属组mysql的文件
find /  -group mysql -type f  -print

#查找2天内被更改过的文件
find . -mtime -2 -type f -print

#查找2天前被更改过的文件
find . -mtime +2 -type f -print

#查找一天内被访问的文件
find . -atime -1 -type f -print


#查找一天前被访问的文件
find . -atime +1 -type f -print

#查找一天内状态被改变的文件
find . -ctime -1 -type f -print

#查找一天前状态被改变的文件
find . -ctime +1 -type f -print

#查找10分钟以前状态被改变的文件
find . -cmin +10 -type f -print

#查找比aa.txt新的文件
find . -newer "aa.txt"  -type f -print

#查找比aa.txt旧的文件
find . ! -newer "aa.txt"  -type f -print

#查找比aa.txt新，比bb.txt旧的文件
find . -newer 'aa.txt' ! -newer 'bb.txt' -type f -print

#查找超过1M的文件
find / -size +1M -type f -print

#查找等于6字节的文件
find . -size 6c -print


#查找小于32k的文件
find . -size -32k -print


#查找del.txt并删除，删除前提示确认
find . -name 'del.txt' -ok rm {} \;


#查找aa.txt 并备份为aa.txt.bak
find . -name 'aa.txt' -exec cp {} {}.bak \;

#查找aa.txt 归档压缩为aa.txt.tar.gz 并删除aa.txt
find . -name "aa.txt" -type f -exec tar -zcvf {}.tar.gz {} \; -exec rm -rf {} \; > /dev/null


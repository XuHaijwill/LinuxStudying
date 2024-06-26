#!/bin/bash

#Linux/Unix shell 脚本清除归档日志文件
#robin@SZDB:~/dba_scripts/custom/bin> more remove_arch_dump.sh
#a、该脚本通过一个外部循环来读取oratab中定义的数据库的SID来寻找对应数据库的归档日志路径以及datapump dump路径。
#b、使用了一个for循环来清除归档日志，且保留最后的2个归档日志文件。
#c、接下来的另一个for循环则用来清除当前SID下对应的dump(Oracle datapump)目录下导出的dump文件。
#d、同清除归档日志一样，设定了保留dump目录最近的5个文件。保留多少个最近的文件(dump的5，或者归档日志2)可以修改。
#e、如果不需要清除dump路径，可以将dump部分注释掉。
#f、根据需要将其部署到crontab。

# ------------------------------------------------------------+
#   FileName: remove_arch_dump.sh                             |
#   Desc:                                                     |
#        Remove old archived log and data pump file           |
#   Usage:                                                    |
#        ./remove_arch_dump.sh                                |
#                                                             |
#   Authror : Robinson                                        |
#   Blog    : http://blog.csdn.net/robinson_0612              |
# ------------------------------------------------------------+

filename=/etc/oratab

cat $filename | while read LINE
do
    case $LINE in
        \#*)                ;;        #comment-line in oratab
        *)
        ORACLE_SID=`echo $LINE | awk -F: '{print $1}' -`
        echo $ORACLE_SID

        # ---------------------------------
        # define archived log directory
        # ---------------------------------
        dir=/u02/database/$ORACLE_SID/archive/
        echo $dir

        filelist=`ls -t $dir`
        echo $filelist

        # ----------------------------------------------------------
        # start to remove archived log and keep last 2 archived log
        # ----------------------------------------------------------
        count=0
        for filename in $filelist
        do
                echo $filename
                count=$(($count+1))
                if [ $count -gt 2 ]; then
                        echo $count
                        rm -vrf $dir$filename
                fi
        done
        ls -tr $dir

        # --------------------------------
        # define data pump dump directory
        # --------------------------------
        dir=/u02/database/$ORACLE_SID/BNR/dump/
        echo $dir

        filelist=`ls -t $dir`
        echo $filelist

        # ---------------------------------------------------------
        # start to remove data pump file and keep last 5 dump file
        # ---------------------------------------------------------
        count=0
        for filename in $filelist
        do
                echo $filename
                count=$(($count+1))
                if [ $count -gt 5 ]; then
                        echo $count
                        rm -vrf $dir$filename
                fi
        done
        ls -tr $dir

     ;;
    esac
done
exit

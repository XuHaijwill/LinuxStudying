#!/bin/bash

# 如果一定要让函数返回一个或多个值，可以定义全局变量，函数将计算结果赋给全局变量，然后脚本中其他地方通过访问全局变量，就可以获得那个函数“返回”的一个或多个执行结果了。

# [devadmin@swarm1 pos-gateway]$ mytest 1
# arg1 = 1
# [devadmin@swarm1 pos-gateway]$ echo $?
# 100
# [devadmin@swarm1 pos-gateway]$ mytest 2
# arg1 = 2
# [devadmin@swarm1 pos-gateway]$ echo $?
# 200
# function mytest()   {       echo "arg1 = $1"  ;     if [ $1 = "1" ] ;then           return 100;     else           return 200;     fi  ; }

function mytest() {
    echo "arg1 = $1"
    if [ $1 = "1" ]; then return 100; else return 200; fi
}

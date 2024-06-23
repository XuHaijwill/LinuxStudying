# LinuxStudying

作为docker镜像的存储仓库使用，和阿里云配合使用，用来存储个性化镜像，可以直接拉取使用。


字符	说明
$n	获取第n个参数，这里n不是字母n，而是指某个数字，如 $1、${12}
$#	参数个数
$*	所有函数的参数
$@	与$*相同，区别是加引号时返回参数的形式不一样
$?	获取函数返回值

## Shell脚本调用另一个脚本的三种方法
https://cloud.tencent.com/developer/article/1398438

```shell
我们需要知道Shell中按照变量的作用域和生命周期，Shell变量可分为四大类：

 （1）永久环境变量：需要修改配置文件，变量永久生效。

 （2）临时环境变量：使用export命令行声明即可，变量在shell脚本进程结束后仍然有效，但在关闭当前shell会话后失效。

 （3）全局变量：在脚本中定义，仅在当前Shell脚本中有效，其他Shell脚本进程不能访本，其作用域从定义的位置开始，到脚本结束或被显示删除的地方为止。注意，全局变量既可以在Shell函数内定义，也可以在shell函数外定义，因为shell函数内定义的变量默认为global，且作用域从“函数被调用时执行变量定义的地方”开始，到脚本结束或被显示删除的地方为止。

 （4）局部变量。在shell脚本中函数内显示使用local关键字定义的变量。其作用域局限于函数内。同名local变量会屏蔽global变量。

所以，使用export命令我们申明的是临时环境变量，在当前shell会话中，所有的shell实例都可以访问由export命令申明的临时环境变量。因为当前shell会话中的所有shell实例，都是当前shell会话的子进程，所以可以与父进程一同访问环境变量。

second.sh修改如下：
```

```shell
#!/bin/bash
export second=lvlv
echo 'your are in second file'
sh first.sh
```
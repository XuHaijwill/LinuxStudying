#!/bin/bash

#显示当前目录文件或者文件占用空间：du
#显示指定文件或文件夹的大小：du test.txt
#方便阅读的格式查看目录所占空间情况：du -h test
#仅显示当前文件夹的总计：du -s *
#以方便阅读的方式查看指定目录层级的空间占用情况：du -lh --max-depth=1

#查看目录大小的命令是du（当然也可以查看文件大小），例如：du ems_data，就是查看ems_data目录下各子目录的大小；du，就是查看当前目录下各子目录的大小；du *，就是查看当前目录下各子目录和文件的大小。
#
#为了提高查看效果，我们需要对结果进行排序，因为du的命令结果很乱，例如：

#从大到小排列：
du ems_data | sort -nr
#按目录名排列：
du ems_data | sort +1 -2
#选出排在前面的10个：
du ems_data | sort -rn | head
#选出排在后面的10个：
du ems_data  |sort -rn | tail
#当前目录的大小：
du -sh .
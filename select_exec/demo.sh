#!/bin/bash

# 检查服务状态函数
check_service_status() {
    systemctl is-active $1
}

# 启动服务函数
start_service() {
    systemctl start $1
}

# 停止服务函数
stop_service() {
    systemctl stop $1
}

# 重启服务函数
restart_service() {
    systemctl restart $1
}

# 根据用户输入执行不同的操作
echo "请选择要执行的操作："
echo "1. 检查服务状态"
echo "2. 启动服务"
echo "3. 停止服务"
echo "4. 重启服务"

read choice

case $choice in
    1)
        echo "请输入要检查的服务名："
        read service_name
        check_service_status $service_name
        ;;
    2)
        echo "请输入要启动的服务名："
        read service_name
        start_service $service_name
        ;;
    3)
        echo "请输入要停止的服务名："
        read service_name
        stop_service $service_name
        ;;
    4)
        echo "请输入要重启的服务名："
        read service_name
        restart_service $service_name
        ;;
    *)
        echo "无效的选择"
        ;;
esac
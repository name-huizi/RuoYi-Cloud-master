#!/bin/bash

# 设置UTF-8环境（解决中文乱码）
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# 打印启动信息（修正后的中文显示）
printf "\n"
printf "[信息] 使用Jar方式启动Gateway服务\n"
printf "\n"

# 获取脚本绝对路径并切换到target目录
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
TARGET_DIR="${SCRIPT_DIR}/../ruoyi-gateway/target"

if ! cd "$TARGET_DIR"; then
    printf "错误：无法进入目录 %s\n" "$TARGET_DIR" >&2
    printf "请确认以下目录结构：\n"
    ls -la "${SCRIPT_DIR}/../"
    exit 1
fi

# 设置Java参数
JAVA_OPTS="-Xms512m -Xmx1024m -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m"

# 检查jar文件是否存在
if [ ! -f "ruoyi-gateway.jar" ]; then
    printf "错误：未找到 ruoyi-gateway.jar\n" >&2
    printf "当前目录内容：\n"
    ls -l
    printf "\n请先执行打包命令：mvn clean package\n"
    exit 1
fi

# 启动服务（带错误捕获）
printf "正在启动Gateway服务...\n"
if ! java -Dfile.encoding=UTF-8 $JAVA_OPTS -jar ruoyi-gateway.jar; then
    printf "\n服务启动失败，请检查日志\n" >&2
    exit 1
fi

# 返回bin目录（非必需步骤）
if cd "$SCRIPT_DIR";
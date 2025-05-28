#!/bin/bash

echo ""
echo "okok"
echo ""

# 获取当前脚本所在目录的绝对路径
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
echo "当前脚本目录: $SCRIPT_DIR"

# 进入脚本所在目录
if ! cd "$SCRIPT_DIR"; then
echo "无法进入脚本目录: $SCRIPT_DIR" >&2
exit 1
fi

# 返回上级目录
if ! cd ..; then
echo "无法返回上级目录" >&2
exit 1
fi
echo "当前工作目录: $(pwd)"

# 检查pom.xml是否存在
if [ ! -f "pom.xml" ]; then
echo "错误：在当前目录找不到pom.xml" >&2
exit 1
fi

# 执行Maven打包
mvn clean package -Dmaven.test.skip=true

# 等待用户输入
read -r -p "按任意键继续..." -n 1 -s
echo ""

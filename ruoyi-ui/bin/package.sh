#!/bin/bash

echo "okok"
echo "[信息] 安装Web工程，生成node_modules文件。"
echo ""

cd "$(dirname "$0")/.."
npm install --registry=https://registry.npmmirror.com

read -p "按任意键继续..." -n1 -s
echo ""

#!/bin/bash

# 项目路径
PROJECT_DIR="/root/java_docker_test"

# 进入项目目录
cd "$PROJECT_DIR" || { echo "项目目录不存在，退出"; exit 1; }

echo "==> 拉取最新代码..."
git pull origin master || { echo "git pull 失败，退出"; exit 1; }

echo "==> 编译打包 jar..."
mvn clean install -DskipTests || { echo "mvn 编译失败，退出"; exit 1; }

echo "==> 构建 Docker 镜像..."
docker build -t myapp:latest . || { echo "docker build 失败，退出"; exit 1; }

echo "==> 使用 docker-compose 启动/更新服务..."
docker-compose up -d --build || { echo "docker-compose 启动失败，退出"; exit 1; }

echo "==> 部署完成！"

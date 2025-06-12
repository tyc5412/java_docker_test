# 使用官方 JDK 17 镜像
FROM openjdk:17-jdk-alpine

WORKDIR /app

# 复制 jar 文件（请替换成你实际的 jar 名）
COPY target/demo-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]

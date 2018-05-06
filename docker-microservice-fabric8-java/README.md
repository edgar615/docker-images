# 微服务构建docker镜像的公共文件

#启动
```
HOSTIP=`ip -4 addr show scope global dev docker0 | grep inet | awk '{print \$2}' | cut -d / -f 1`
docker run --name=om-api --cap-add=SYS_PTRACE --add-host=docker:${HOSTIP} -d  -m 300m -p 9000:9000 \
edgar615/om-api --spring.datasource.url=jdbc:mysql://docker:3306/sys
```
日志文件
-v /var/log/micoservice:/log

时区
-e TZ="Asia/Shanghai" 

解决tomcat8启动慢

-e JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom"
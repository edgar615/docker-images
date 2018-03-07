FROM registry.cn-hangzhou.aliyuncs.com/edgar615/jdk:8u151
MAINTAINER Edgar

#预留的内存，这部分内存不会被分配给应用
ENV RESERVED_MEGABYTES 0

# TimeZone
RUN apk update && apk add tzdata \
	&& cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& echo "Asia/Shanghai" > /etc/timezone

#COPY om-api.tgz /home/admin/om-api.tgz
COPY *.jar /microservice/
COPY lib/* /microservice/lib/
COPY run.sh /run.sh

RUN chmod +x /*.sh

EXPOSE 9000 9000
ENTRYPOINT ["/run.sh"]
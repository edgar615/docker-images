FROM fabric8/java-alpine-openjdk8-jdk
MAINTAINER Edgar

#预留的内存，这部分内存不会被分配给应用
ENV RESERVED_MEGABYTES 0

# TimeZone
RUN apk update && apk add tzdata \
	&& cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
	&& echo "Asia/Shanghai" > /etc/timezone

COPY *.jar /deployments/
COPY lib/* /deployments/lib/
COPY run.sh /run.sh

RUN chmod +x /*.sh

EXPOSE 9000 9000
ENTRYPOINT ["/deployments/run-java.sh"]
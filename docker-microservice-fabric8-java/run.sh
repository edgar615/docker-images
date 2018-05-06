#!/bin/sh

#print help info
#echo "========================================================================"
#echo "You can change service environment by the following parameters:"
#echo "------------- mysql config ------------"
#echo "|                                      "
#echo "------------------------------------------"
#echo "========================================================================"

#limit memory
#根据docker的内存计算堆内存，参考https://yq.aliyun.com/articles/18037
limit_in_bytes=$(cat /sys/fs/cgroup/memory/memory.limit_in_bytes)
echo "limit_in_bytes" "$limit_in_bytes"
# If not default limit_in_bytes in cgroup
if [ "$limit_in_bytes" -ne "9223372036854771712" ]
then
  #计算的docker容器的可用内存，单位m 1024*1024
    limit_in_megabytes=$(expr $limit_in_bytes \/ 1048576)
    heap_size=$(expr $limit_in_megabytes - $RESERVED_MEGABYTES)
    export JAVA_OPTS="-Xms${heap_size}m -Xmx${heap_size}m $JAVA_OPTS"
    echo JAVA_OPTS=$JAVA_OPTS
fi

echo "args:" "$*"
echo "JAVA_OPTS:" "$JAVA_OPTS"
# 不将结果输出到console，所有的微服务都约定写日志文件
if [ -z "$JAVA_OPTS" ]
then
	java -jar /microservice/microservice-*.jar "$@" > /dev/null 2>&1
else
  java $JAVA_OPTS -jar /microservice/microservice-*.jar "$@" > /dev/null 2>&1
fi

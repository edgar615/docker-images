用alpine安装oracle jdk，运行出错

```
/bin/sh: java: not found
```
搜索了一下是因为缺少glibc，找了个例子抄过来
https://github.com/frol/docker-alpine-glibc
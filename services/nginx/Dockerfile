ARG NGINX_VERSION

FROM nginx:${NGINX_VERSION}

# 设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Ubuntu软件源选择中国的服务器
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

# 安装依赖
RUN apt-get update && apt-get install -y \
    vim \
    curl \
    wget

WORKDIR /data/www
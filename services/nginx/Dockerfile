FROM ubuntu:18.04
LABEL authors="likan"

# 设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Ubuntu软件源选择中国的服务器
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

# 安装依赖
RUN apt-get update && apt-get install -y \
    vim \
    gcc \
    make \
    curl \
    unzip \
    libzip-dev \
    wget

# 拷贝相关依赖
ADD ./nginx-1.25.1.tar.gz /usr/local/src
ADD ./pcre2-10.42.tar.gz /usr/local/src

# 安装nginx
RUN cd /usr/local/src/nginx-1.25.1 && \
    ./configure --with-pcre=/usr/local/src/pcre2-10.42 && \
    make && make install && \
    ln -s /usr/local/nginx/sbin/nginx /usr/local/bin/

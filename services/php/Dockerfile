
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
    make \
    gcc \
    g++ \
    openssl \
    curl \
    libcurl4-openssl-dev \
    libbz2-dev \
    libxml2-dev \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    libzip-dev \
    libssl-dev \
    unzip \
    sqlite3 \
    libsqlite3-dev \
    libonig-dev

# 拷贝相关依赖
ADD ./php-8.1.21.tar.gz /usr/local/src

# 安装php
RUN cd /usr/local/src/php-8.1.21 && ./configure \
    --enable-fpm \
    --with-mysqli \
    --with-pdo-mysql \
    --with-iconv-dir \
    --with-freetype-dir \
    --with-jpeg-dir \
    --with-png-dir \
    --with-zlib \
    --with-libxml-dir=/usr \
    --enable-xml \
    --disable-rpath \
    --enable-bcmath \
    --enable-shmop \
    --enable-sysvsem \
    --enable-inline-optimization \
    --with-curl \
    --enable-mbregex \
    --enable-mbstring \
    --enable-ftp \
    --with-gd \
    --with-openssl \
    --with-mhash \
    --enable-pcntl \
    --enable-sockets \
    --with-xmlrpc \
    --enable-zip \
    --enable-soap \
    --without-pear \
    --with-gettext \
    --disable-fileinfo \
    --enable-maintainer-zts && \
    make && make install &&\
    ln -s /usr/local/php/sbin/php-fpm /usr/local/bin/
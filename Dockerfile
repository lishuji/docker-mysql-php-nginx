FROM ubuntu:18.04

LABEL maintainer="lishuji2547@gmail.com"

#创建用户
RUN useradd www

#安装依赖
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
    libonig-dev \
    supervisor

#拷贝相关依赖
ADD apk/nginx-1.25.1.tar.gz /usr/local/src
ADD apk/php-8.1.21.tar.gz /usr/local/src
ADD apk/zlib-1.2.8.tar.gz /usr/local/src
ADD apk/pcre2-10.42.tar.gz /usr/local/src

#安装nginx依赖
RUN cd /usr/local/src/zlib-1.2.8 && ./configure && make && make install

#安装nginx
RUN cd /usr/local/src/nginx-1.25.1 && \
    ./configure --with-pcre=/usr/local/src/pcre2-10.42 && \
    make && make install && \
    ln -s /usr/local/nginx/sbin/nginx /usr/local/bin/

#安装PHP
RUN cd /usr/local/src/php-8.1.21 && ./configure \
    --prefix=/usr/local/php \
    --with-config-file-path=/usr/local/php/etc \
    --enable-fpm \
    --with-fpm-user=www \
    --with-fpm-group=www \
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

EXPOSE 80
VOLUME ["./www"]
WORKDIR www
ENTRYPOINT ["supervisord", "-nc", "/etc/supervisor/supervisord.conf"]
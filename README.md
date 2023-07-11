# docker-mysql-php-nginx
docker-mysql-php-nginx 容器化

# 目录结构
```
├── README.md
├── docker-compose.yml
├── configs
│   ├── nginx
│   │   ├── conf.d
│   │   │   └── default.conf
│   │   └── nginx.conf
│   └── php
│       └── php.ini
├── data
│   └── mysql
├── logs
│   ├── nginx
│   └── php
│   └── mysql
```

# 使用方法
```
git clone git@github.com:lishuji/docker-mysql-php-nginx.git

cd docker-mysql-php-nginx

docker-compose up -d
```

# 说明
### nginx
- nginx 默认端口为 80
- nginx 日志文件存放在 logs/nginx 目录下
- nginx 默认根目录为 /var/www/html
- nginx 默认虚拟主机配置文件为 configs/nginx/conf.d/default.conf

### php
- php 默认端口为 9000
- php 日志文件存放在 logs/php 目录下
- php 配置文件存放在 configs/php 目录下
- php 默认根目录为 /var/www/html

### mysql
- mysql 默认端口为 3306
- mysql 默认密码为 root
- mysql 数据库文件存放在 data/mysql 目录下

### docker-compose.yml
- docker-compose.yml 文件中的 volumes 配置，将本地的目录挂载到容器中，方便修改配置文件
- docker-compose.yml 文件中的 networks 配置，将容器加入到同一个网络中，方便容器之间的通信
- docker-compose.yml 文件中的 ports 配置，将容器的端口映射到本地，方便访问
- docker-compose.yml 文件中的 environment 配置，设置容器的环境变量
- docker-compose.yml 文件中的 depends_on 配置，设置容器的启动顺序
- docker-compose.yml 文件中的 restart 配置，设置容器的重启策略
- docker-compose.yml 文件中的 links 配置，设置容器之间的连接
- docker-compose.yml 文件中的 image 配置，设置容器构建时使用的镜像
- docker-compose.yml 文件中的 container_name 配置，设置容器的名称


# 参考
- [Docker：网络模式详解](https://outmanzzq.github.io/2019/10/22/docker-network/)
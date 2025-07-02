### 慧贸OS 部署手册




#### 1. 应用信息

##### 1.1 中间件

| 服务名称             | 应用名称             | 版本号         | 端口号     |
| -------------------- | -------------------- | -------------- | ---------- |
| 业务数据库           | hmos_mysql           | 5.7.44         | 3306       |
| 业务数据库           | hmos_pgsql           | 16             | 5432       |
| 业务数据库           | hmos_redis           | 8.0-M02        | 6379       |
| 业务数据库           | hmos_mongodb         | 8.0.3          | 27017      |
| 配置管理             | nacos                | 2.0.0          | 8848       |
| 消息队列服务         | hmos_rabbitMQ        | 4.0-management | 5672/15672 |
| 连接器管理系统数据库 | connection_system_db | 16             | 54322      |



##### 1.2 前端应用

| 服务名称    | 应用名称              | 端口号 |
| ----------- | --------------------- | ------ |
| nginx总代理 | nginx                 | 80     |
| 门户首页    | aeotrade_portal       | 3000   |
| 工作台      | aeotrade_container    | 3001   |
| 开放平台    | aeotrade_openPlatform | 3002   |



##### 1.2 后端应用

| 服务名称       | 应用名称                 | 端口号 |
| -------------- | ------------------------ | ------ |
| 业务系统       | aeotrade-provider-mamber | 8092   |
| 用户运营系统   | aeotrade-provider-admin  | 8094   |
| 登录鉴权系统   | aeotrade-provider-oauth  | 8080   |
| 网关系统       | aeotrade-server-gateway  | 8077   |
| 消息日志系统   | aeotrade-server-message  | 8087   |
| 区块链集成服务 | aeotrade-server-chain    | 8059   |
| 连接器管理系统 | connection_system        | 8011   |
| 合约系统       | aeochaincontract         | 8081   |
| 交换系统       | aeochainexchange         | 8082   |



#### 2. 下载部署包

```bash
# 下载部署包
git clone

# 查看目录结构
.
├── aeochaincontract
│   ├── application.properties
│   └── docker-compose.yml
├── aeochainexchange
│   ├── application.properties
│   └── docker-compose.yml
├── aeotrade-cloud
│   └── docker-compose.yml
├── aeotrade-web
│   ├── aeotrade_container
│   │   ├── docker-compose.yml
│   │   └── nginx.conf
│   ├── aeotrade_openPlatform
│   │   ├── docker-compose.yml
│   │   └── nginx.conf
│   └── aeotrade_portal
│       └── docker-compose.yml
├── connection_system
│   └── docker-compose.yml
├── middleware
│   ├── docker-compose.yml
│   ├── init
│   │   ├── connection_system_db_init.sql
│   │   ├── mysql_init.sql
│   │   └── pgsql_init.sql
│   └── sql
│       ├── aeotrade.sql
│       ├── mall.sql
│       ├── nacos_config.sql
│       ├── weixin.sql
│       └── wx.sql
├── nacos
│   ├── custom.properties
│   ├── docker-compose.yml
│   └── nacos_config_export.zip
├── nginx
│   ├── docker-compose.yml
│   └── nginx.conf
└── README.md
```



#### 3. 中间件部署

##### 3.1 数据库部署

```bash
# 进入middleware目录
cd middleware/

# 修改 docker-compose.yml 文件，完善数据库密码信息
vim docker-compose.yml

# 进入init数据库初始化脚本目录
cd init/

# 修改初始化脚本内容，补全数据库用户密码信息
vim connection_system_db_init.sql
vim mysql_init.sql
vim pgsql_init.sql

# 启动服务
docker-compose up -d
```



##### 3.2 数据库初始化

###### 3.2.1 Mysql 初始化

```sql
# 将数据库初始化sql拷贝至容器
docker cp sql mysql:/sql

# 初始化数据库
mysql -uroot -p aeotrade < /sql/aeotrade.sql
mysql -uroot -p mall < /sql/mall.sql
mysql -uroot -p weixin < /sql/weixin.sql
mysql -uroot -p wx < /sql/wx.sql
mysql -uroot -p nacos_config < /sql/nacos_config.sql
```

###### 3.2.2 MongoDB 初始化

```bash
# 进入容器
docker exec -it hmos_mongodb mongosh admin
  
# 验证用户
use admin;
db.auth("用户名","密码")
  
# 创建用户
use aeotrade;

# 授权用户
db.createUser( {user: "用户名",pwd: "密码",roles: [ { role: "dbOwner", db: "aeotrade" } ]})
```



##### 3.3 nacos部署

###### 3.3.1 初始化nacos数据库

```sql
# 进入数据库，插入nacos用户
mysql -uroot -p 

use nacos_config;
INSERT INTO `users` (`username`, `password`, `enabled`) VALUES ('nacos', '$2a$10$PdaaPE3E6WVZBuYuaM.lOe7rH89Tp3.mk0turFUiJlPQ5Ylobh6pu', 1);
```

###### 3.3.2 启动服务

```bash
# 进入nacos部署目录
cd nacos

# 修改 docker-compose.yml 文件，完善密码信息
vim docker-compose.yml

# 修改 custom.properties 配置文件，修改数据库连接信息，可自定义nacos配置

# 启动服务
docker-compose up -d

# 访问nacos页面
<IP>:8848/nacos
用户: nacos
密码: nacos
```

###### 3.3.3 导入java微服务配置

```bash
# 进入nacos目录
cd nacos

# 目录结构
.
├── custom.properties
├── docker-compose.yml
└── nacos_config_export.zip

# 将配置包导入nacos
登录nacos系统页面
<IP>:8848/nacos
配置管理 ——> 配置列表 ——> 导入配置 ——> 上传文件
nacos_config_export.zip

# 修改nacos配置，完善数据库等中间件连接信息
```



#### 4. 基础应用部署

##### 4.1 java微服务部署

```bash
# 进入aeotrade-cloud目录
cd aeotrade-cloud/

# 修改 docker-compose.yml 文件，完善配置信息
vim docker-compose.yml

NACOS_URL                             nacos服务IP地址
SPRING_CLOUD_NACOS_DISCOVERY_IP       当前服务所在服务器的IP地址

# 启动服务
docker-compose up -d
```



##### 4.2 前端应用部署

```bash
# 进入aeotrade-web目录
cd aeotrade-web/

# 目录结构
.
├── aeotrade_container
├── aeotrade_openPlatform
└── aeotrade_portal

# 修改配置
1. 修改 aeotrade_portal 和 aeotrade_container 服务的 docker-compose.yml 文件 (backend 参数配置为nginx总代理所在服务器的IP地址)

2. 修改 aeotrade_container 服务的 nginx.conf 文件，完善网关服务的地址信息 (即aeotrade-server-gateway服务)

3. 修改 aeotrade_openPlatform 服务的 nginx.conf 文件，proxy_pass 地址为nginx总代理的IP地址

# 分别进入每个应用目录，启动服务
docker-compose up -d
```



##### 4.3 nginx代理部署

```bash
# 进入nginx目录
cd nginx/

# 目录结构
.
├── docker-compose.yml
└── nginx.conf

# 修改 nginx.conf 文件，完善地址信息
vim nginx.conf

# 一键启动服务
docker-compose up -d
```



##### 4.4 连接器管理系统部署

```bash
# 进入连接器管理系统目录
cd connection_system

# 目录结构
.
├── docker-compose.yml
└── .env

# 修改 .env 配置文件，完善配置信息
vim .env

# 启动服务
docker-compose up -d
```



##### 4.5 合约交换系统队列配置

```bash
# 在部署交换及合约系统前，需创建RabbitMq队列

# 登录 RabbitMQ <IP>:15672，创建队列
# 参考配置
User：U_INTERCHANGE_01
Password：test
V-host：V_INTERCHANGE_01
合约发给交换的队列 ：Q_CONTRACTSYS01_TO_INTERCHANGE
交换发给合约的队列 ：Q_INTERCHANGE_TO_CONTRACTSYS01
```



##### 4.6 合约系统部署

```bash
# 进入合约系统目录
cd aeochaincontract

# 目录结构
.
├── application.properties
└── docker-compose.yml

# 修改 application.properties 配置文件，完善配置信息
vim application.properties

# 启动服务
docker-compose up -d
```



##### 4.7 交换系统部署

```bash
# 进入交换系统目录
cd aeochainexchange

# 目录结构
.
├── application.properties
└── docker-compose.yml

# 修改 application.properties 配置文件，完善配置信息
vim application.properties

# 启动服务
docker-compose up -d
```

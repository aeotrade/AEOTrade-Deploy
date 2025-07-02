-- 创建连接器管理系统数据库
CREATE USER conn WITH PASSWORD '';
CREATE DATABASE connection_system OWNER conn;
GRANT ALL PRIVILEGES ON DATABASE connection_system TO conn;

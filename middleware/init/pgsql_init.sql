-- 创建连接用户
CREATE USER pguser WITH PASSWORD '';

-- 创建数据库
CREATE DATABASE log_manage_pro OWNER pguser;

-- 赋权
GRANT ALL PRIVILEGES ON DATABASE log_manage_pro TO pguser;

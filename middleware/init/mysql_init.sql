-- 创建业务数据库
create schema aeotrade default character set utf8 collate utf8_general_ci;
create schema mall default character set utf8 collate utf8_general_ci;
create schema wx default character set utf8 collate utf8_general_ci;
create schema weixin default character set utf8 collate utf8_general_ci;

-- 创建nacos数据库
create schema nacos_config default character set utf8 collate utf8_general_ci;

-- 创建连接用户
CREATE USER 'aeotrade'@'%' IDENTIFIED BY 'aeotrade';
CREATE USER 'nacos'@'%' IDENTIFIED BY 'nacos';

-- 赋权
GRANT ALL PRIVILEGES ON aeotrade.* TO 'aeotrade'@'%';
GRANT ALL PRIVILEGES ON mall.* TO 'aeotrade'@'%';
GRANT ALL PRIVILEGES ON wx.* TO 'aeotrade'@'%';
GRANT ALL PRIVILEGES ON weixin.* TO 'aeotrade'@'%';
GRANT ALL PRIVILEGES ON nacos_config.* TO 'nacos'@'%';

-- 刷新权限
flush privileges;

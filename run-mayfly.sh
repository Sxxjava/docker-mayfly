#!/bin/sh

# 读取定义环境变量
jwtKey=${MAYFLY_JWT_KEY:-"53445c86e8189b6c646ed7d0d319015144423e72"}
aesKey=${MAYFLY_AES_KEY:-"7bc5418eefd50402ef39107274891fbe"}
mysqlHost=${MAYFLY_MYSQL_HOST:-"localhost:3306"}
mysqlUser=${MAYFLY_MYSQL_USER:-"root"}
mysqlPass=${MAYFLY_MYSQL_PASS:-"123456"}
mysqlDb=${MAYFLY_MYSQL_DB:-"mayfly"}

echo "jwtKey: ${jwtKey}"
echo "aesKey: ${aesKey}"
echo "mysqlHost: ${mysqlHost}"
echo "mysqlUser: ${mysqlUser}"
echo "mysqlPass: ${mysqlPass}"
echo "mysqlDb: ${mysqlDb}"

# 输出配置文件
sed -i 's/#JWT_KEY#/'${jwtKey}'/g' config.yml
sed -i 's/#AES_KEY#/'${aesKey}'/g' config.yml
sed -i 's/#MYSQL_HOST#/'${mysqlHost}'/g' config.yml
sed -i 's/#MYSQL_USER#/'${mysqlUser}'/g' config.yml
sed -i 's/#MYSQL_PASSWORD#/'${mysqlPass}'/g' config.yml
sed -i 's/#MYSQL_DB#/'${mysqlDb}'/g' config.yml


exec ./mayfly-go

# 基于Alpine镜像构建的极为精简的Mayfly-go镜像

### Dockerfile开源地址: https://github.com/sxxjava/docker-mayfly

### 镜像说明
* 配置项通过环境变量来注入
* 可灵活部署, 支持k8s云原生环境
* 镜像体积小
* 时区已设置为Asia/Shanghai
* 支持中文字体

### 环境变量说明
|环境变量名称                    | 环境变量说明                                              |
| -------------------------------------- | -------------------------------------------------------------- |
| MAYFLY_JWT_KEY         | mayfly生成jwt token使用的签名key        |
| MAYFLY_AES_KEY          | mayfly用于AES加密使用的秘钥               |
| MAYFLY_MYSQL_HOST | mayfly数据库地址和端口                          |
| MAYFLY_MYSQL_USER | mayfly数据库用户名                                   |
| MAYFLY_MYSQL_PASS | mayfly数据库密码                                       |
| MAYFLY_MYSQL_DB      | mayfly数据库名称                                       |

### 使用示例
```shell
docker run -d --name mayfly -p 8888:8888 \
-e MAYFLY_JWT_KEY=53445c86e8189b6c646ed7d0d319015144423e72 \
-e MAYFLY_AES_KEY=7bc5418eefd50402ef39107274891fbe \
-e MAYFLY_MYSQL_HOST=localhost:3306 \
-e MAYFLY_MYSQL_USER=root \
-e MAYFLY_MYSQL_PASS=123456 \
-e MAYFLY_MYSQL_DB=mayfly  sxxjava/mayfly:1.3.0-alpine
```

### 部署后访问
- http://localhost:8888
- 默认用户名: admin
- 默认密码: admin123.
- 注意默认密码admin123. 最后是有个"."的

### 官方使用说明
- 项目文档: https://objs.gitee.io/mayfly-go-docs
- 系统操作视频: https://space.bilibili.com/484091081/channel/collectiondetail?sid=392854

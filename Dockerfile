FROM alpine:3.17

LABEL author="Songxx"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk update && apk add --no-cache tzdata ttf-dejavu fontconfig \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && rm -rf /var/cache/apk/* && rm -rf /root/.cache && rm -rf /tmp/*

RUN mkdir -p /mayfly

WORKDIR /mayfly

COPY ./mayfly-go-linux-amd64/mayfly-go /mayfly/

COPY ./mayfly-go-linux-amd64/config.yml /mayfly/

COPY ./run-mayfly.sh /mayfly/

EXPOSE 8888

ENV MAYFLY_JWT_KEY "53445c86e8189b6c646ed7d0d319015144423e72"
ENV MAYFLY_AES_KEY "7bc5418eefd50402ef39107274891fbe"
ENV MAYFLY_MYSQL_HOST "localhost:3306"
ENV MAYFLY_MYSQL_USER "root"
ENV MAYFLY_MYSQL_PASS "123456"
ENV MAYFLY_MYSQL_DB "mayfly"

CMD ["/mayfly/run-mayfly.sh"]

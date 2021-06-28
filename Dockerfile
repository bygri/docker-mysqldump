FROM alpine

RUN apk add --no-cache mysql-client
ADD mysqldump /etc/periodic/daily
RUN chmod a+x /etc/periodic/daily/mysqldump

CMD crond -f

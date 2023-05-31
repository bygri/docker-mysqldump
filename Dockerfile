FROM alpine

RUN apk add --no-cache mysql-client
ADD mysqldump /etc/periodic/daily
RUN chmod a+x /etc/periodic/daily/mysqldump

COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT entrypoint.sh

CMD crond -f

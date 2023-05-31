#!/bin/sh
set -e

# If MYSQL_PASSWORD_FILE set, overwrite MYSQL_PASSWORD with it
# https://web.archive.org/web/20160711205930/http://porkmail.org/era/unix/award.html
[ -n "$MYSQL_PASSWORD_FILE" ] && { export MYSQL_PASSWORD=`cat $MYSQL_PASSWORD_FILE`; exit 1; }

exec "$@"

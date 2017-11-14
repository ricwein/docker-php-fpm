FROM yavin/alpine-php-fpm:7.1
MAINTAINER Richard Weinhold <docker@ricwein.com>
LABEL name "alpine-php-fpm"

# set default timezone
ARG timezone
RUN echo 'date.timezone = ${timezone:-Europe/Berlin}' > /etc/php7/conf.d/55-date.ini

RUN apk --update add \
  php7-imap \
  php7-mysqli \
  php7-redis

RUN rm -rf /var/cache/apk/*

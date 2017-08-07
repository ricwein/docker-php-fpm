FROM yavin/alpine-php-fpm:7.1
MAINTAINER Richard Weinhold <docker@ricwein.com>
LABEL name "alpine-php7.1"

# set default timezone
ARG timezone
RUN echo 'date.timezone = ${timezone:-Europe/Berlin}' > /etc/php7/conf.d/55-date.ini

RUN apk --update add \
  php7-imap \
  php7-libsodium \
  php7-mysqli \
  php7-redis

# workaround for libsodium-2.0.4 linking to "libsodium.so"
RUN echo 'extension=sodium.so' > /etc/php7/conf.d/50_libsodium.ini

RUN rm -rf /var/cache/apk/*


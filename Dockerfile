FROM yavin/alpine-php-fpm:7.1
MAINTAINER Richard Weinhold <docker@ricwein.com>
LABEL name "alpine-php-fpm"

# set default timezone
ARG timezone
RUN echo 'date.timezone = ${timezone:-Europe/Berlin}' > /etc/php7/conf.d/55-date.ini

# install additional php-packages
RUN apk --update add php7-imap php7-mysqli php7-redis php7-zlib

# install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php --filename=composer --install-dir=/bin && unlink composer-setup.php
ENV PATH /root/.composer/vendor/bin:$PATH

# cleanup install-caches
RUN rm -rf /var/cache/apk/*

FROM mbnunes/vlk-ubuntu14.04
ARG DEBIAN_FRONTEND=noninteractive

LABEL version="1.0"
LABEL author="Mauricio Nunes <mnunes@vialink.com.br>"

<<<<<<< HEAD
RUN apt-get -y -q --no-install-recommends install \
        curl \
		ca-certificates \
        imagemagick \
        msmtp-mta \
        apache2-mpm-prefork \
        apache2 \
        apache2-dbg \
        libapr1-dbg \
        libaprutil1-dbg \
        php5-cli \
        php5-mysql \
        php5-gd \
		php5-imagick \
        php5-mcrypt \
        php5-curl \
        php5-memcache \
        php5-xsl \
        php5-xdebug \
        php5-intl \
        php5-xmlrpc \
        php5-apcu \
        php5-mongo \
        php5-redis \
        php5 \
        php5-dev \
        php-pear \
        php5-dbg \
        gdb \
        ghostscript \
        pngquant \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/* \
        && rm /var/log/dpkg.log \
        && rm /var/www/html/index.html \
        && rm /etc/php5/apache2/conf.d/* \
        && rm /etc/php5/cli/conf.d/* \
        && php5enmod -s ALL opcache \
        && rm /etc/apache2/conf-enabled/* \
        && rm /etc/apache2/mods-enabled/* \
        && a2enmod mpm_prefork rewrite php5 env dir auth_basic authn_file authz_user authz_host access_compat \
        && rm /etc/apache2/sites-enabled/000-default.conf        


ENV LANG=C
ENV APACHE_LOCK_DIR         /var/lock/apache2
ENV APACHE_RUN_DIR          /var/run/apache2
ENV APACHE_PID_FILE         ${APACHE_RUN_DIR}/apache2.pid
ENV APACHE_LOG_DIR          /var/log/apache2
ENV APACHE_RUN_USER         www-data
ENV APACHE_RUN_GROUP        www-data
ENV APACHE_MAX_REQUEST_WORKERS 32
ENV APACHE_MAX_CONNECTIONS_PER_CHILD 1024
ENV APACHE_ALLOW_OVERRIDE   None
ENV APACHE_ALLOW_ENCODED_SLASHES Off
ENV APACHE_ERRORLOG         ""
ENV APACHE_CUSTOMLOG        ""
ENV APACHE_LOGLEVEL         error
ENV PHP_TIMEZONE            UTC
ENV PHP_MBSTRING_FUNC_OVERLOAD 0
ENV PHP_ALWAYS_POPULATE_RAW_POST_DATA 0

RUN a2enmod ssl \
    && a2enmod php5 \
    && a2enmod rewrite \
    && a2enmod headers

VOLUME [ "/var/www", "/etc/apache2" ]

RUN a2dismod remoteip

EXPOSE 80 443

CMD ["apache2"]

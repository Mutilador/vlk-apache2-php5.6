FROM mbnunes/vlk-ubuntu
ARG DEBIAN_FRONTEND=noninteractive

LABEL version="1.0"
LABEL author="Mauricio Nunes <mnunes@vialink.com.br>"

RUN apt-get update && apt-get install software-properties-common -y && add-apt-repository ppa:ondrej/php -y && apt-get install libapache2-mod-php5.6 apache2 -y 
RUN apt-get install php5.6 php5.6-cgi php5.6-fpm php5.6-mysql php5.6-mcrypt php5.6-mbstring php5.6-json -y

RUN a2enmod rewrite
RUN a2enmod actions

EXPOSE 80 443

COPY php/php5/ /etc/php5

WORKDIR /var/www
RUN chown nobody:nogroup -R /var/www


ENTRYPOINT [ "apache2", "start" ]

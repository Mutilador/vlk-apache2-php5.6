FROM mbnunes/vlk-ubuntu
ARG DEBIAN_FRONTEND=noninteractive

LABEL version="1.0"
LABEL author="Mauricio Nunes <mnunes@vialink.com.br>"

RUN add-apt-repository ppa:ondrej/php && apt-get update && sudo apt-get install -y php5.6 && apt-get install apache2 php5.6*

RUN systemctl enable apache2 && systemctl start apache2
RUN a2enmod rewrite
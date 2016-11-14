FROM msealand/cf9
MAINTAINER fridus

# gateway
ADD ./build/cfapi/Gateway.cfc /var/www/CF/Gateway.cfc

# apache modules
RUN a2enmod rewrite && a2enmod headers

# Timezone
RUN echo Europe/Brussels | sudo tee /etc/timezone && sudo dpkg-reconfigure --frontend noninteractive tzdata

ADD ./build/start.sh /start.sh
RUN chmod +x /start.sh

CMD /start.sh

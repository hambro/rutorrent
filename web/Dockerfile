FROM alpine:edge

RUN apk add --no-cache wget git unrar apache2-utils

# rutorrent
RUN mkdir -p /var/www/app \
    && wget --no-check-certificate https://github.com/Novik/ruTorrent/archive/v3.8.zip -O ruTorrent-3.8.zip \
    && unzip ruTorrent-3.8.zip \
    && mv ruTorrent-3.8/* /var/www/app \
    && rm ruTorrent-3.8.zip \
    && git clone https://github.com/xombiemp/rutorrentMobile.git /var/www/app/plugins/mobile \
    && git clone https://github.com/Phlooo/ruTorrent-MaterialDesign.git /var/www/app/plugins/theme/themes/materialdesign \
    && sed -i -e 's/$defaultTheme = "";/$defaultTheme = "materialdesign";/g' /var/www/app/plugins/theme/conf.php \
    && echo -e "\n\n[ipad]\nenabled = no" >> /var/www/app/conf/access.ini

RUN cd /var/www/app/plugins/ \
    && git clone https://github.com/autodl-community/autodl-rutorrent.git autodl-irssi \
    && cd autodl-irssi \
    && mv _conf.php conf.php

# Rutorrent config
ADD ./config.php /var/www/app/conf


RUN cd /var/www/app/plugins/autodl-irssi/ \
    && sed -i -e 's/$autodlPort = 0;/$autodlPort = 27096;/g' conf.php \
    && sed -i -e 's/$autodlPassword = "";/$autodlPassword = "cNftAMDcgcy63G77";/g' conf.php

# Password
ADD ./.htpasswd /var/www/app

VOLUME ["/var/www/app"]
CMD ["/bin/sh"]

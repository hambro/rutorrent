FROM ubuntu:xenial
# MAINTAINER hambroo <carljohan.hambro@gmail.com>

# HHVM
# Installing packages
RUN apt-get update && apt-get upgrade -y \
	&& apt-get -y install software-properties-common

RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449 \
	&& add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu precise multiverse" \
	&& add-apt-repository "deb http://dl.hhvm.com/ubuntu $(lsb_release -sc) main"
RUN apt-get update && apt-get -y install hhvm --allow-unauthenticated \
	&& apt-get clean && apt-get autoremove -y

# Installing additions to rtorrent
RUN apt-get -y install unrar zip unzip mediainfo supervisor wget rtorrent xterm curl


# ffmpeg for screenshots
RUN	apt-get install ffmpeg -y

# Configuration for HHVM
ADD config/php.ini /etc/hhvm
ADD config/server.ini /etc/hhvm
RUN mkdir -p /home/rtorrent


# Configuration for rtorrent
ADD config/rtorrent.rc /home/rtorrent/.rtorrent.rc

RUN useradd hhvm

# Scripts
ADD supervisor-config/supervisord.conf /etc/supervisor/conf.d/
ADD scripts/ /scripts/
RUN chmod 755 /scripts/*.sh



# IRSSI ######################################
RUN useradd irssi
USER root

RUN apt-get update
RUN apt-get install -y build-essential irssi

# Net::SSLeay +  XML::LibXML dependency
RUN apt-get install -y libssl-dev libxml2-dev curl

RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm Archive::Zip Net::SSLeay HTML::Entities XML::LibXML Digest::SHA JSON JSON::XS

RUN ["sleep", "1"]
ADD irssi/autodl /home/irssi/.autodl/
ADD irssi/install.sh /home/irssi/install.sh
ADD irssi/autodl-irssi-community /home/irssi/autodl-irssi-community/

RUN chown irssi /home/irssi/ -R
RUN sh /home/irssi/install.sh

EXPOSE 5000

CMD ["supervisord", "-c","/etc/supervisor/conf.d/supervisord.conf"]
#CMD ["sleep", "1000"]

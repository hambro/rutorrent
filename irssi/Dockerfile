FROM irssi
MAINTAINER thomaswelton

USER root
RUN apt-get update
RUN apt-get install -y build-essential

# Net::SSLeay dependency
RUN apt-get install -y libssl-dev
# XML::LibXML dependency
RUN apt-get install -y libxml2-dev curl

RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm Archive::Zip Net::SSLeay HTML::Entities XML::LibXML Digest::SHA JSON JSON::XS

ADD autodl /home/user/.autodl/
RUN chown user /home/user/.autodl/ -R

USER user

ADD install.sh /home/user/install.sh
ADD autodl-irssi-community /home/user/autodl-irssi-community/

VOLUME /home/user/watch

RUN sh install.sh

#ADD autodl /home/user/.autodl/

#USER ROOT
#RUN chown user /home/user/.autodl/ -R

CMD ["irssi","--config=/home/user/.autodl", "--home=/home/user/.irssi/","1>/dev/null"]

#CMD ["/home/user/install.sh"]

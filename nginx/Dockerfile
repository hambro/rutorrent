FROM nginx:latest

ADD config/nginx.conf /etc/nginx/
ADD config/rutorrent.conf /etc/nginx/sites-available/
ADD config/upstream.conf /etc/nginx/conf.d/

RUN usermod -u 1000 www-data
RUN apt update
CMD ["nginx"]

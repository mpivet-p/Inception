FROM debian:buster

RUN apt update && apt install nginx -y
#Dev
RUN apt update && apt install vim -y


#RUN rm -rf /etc/nginx/*
#RUN rm -rf /var/www/html/*
#RUN mkdir -p /etc/ssl/private

WORKDIR /etc/nginx

#COPY ./conf/ .
COPY ./conf/wordpress.conf ./conf.d/wordpress.conf
RUN rm -rf modules-available\
        modules-enabled\
        sites-available\
        sites-enabled\
        koi-utf\
        koi-win\
        win-utf\
        snippets\
        uwsgi_params\
        scgi_params\
        proxy_params
RUN sed -e '/include \/etc\/nginx\/sites-enabled/d'\
        -e '/include \/etc\/nginx\/modules-enabled/d'\
        -e '/worker_processes/s/auto/1/'\
        -i  nginx.conf
#RUN mv ./mpivet-p.42.fr.crt ./mpivet-p.42.fr.key /etc/ssl/private/
#RUN mv index.html /var/www/html/

ENTRYPOINT ["nginx", "-g", "daemon off;"]

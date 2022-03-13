FROM debian:buster

RUN apt update && apt install nginx -y


#RUN rm -rf /etc/nginx/*
#RUN rm -rf /var/www/html/*
#RUN mkdir -p /etc/ssl/private

WORKDIR /etc/nginx

#COPY ./conf/ .
COPY ./conf/wordpress.conf ./conf.d/wordpress.conf
#RUN mv ./mpivet-p.42.fr.crt ./mpivet-p.42.fr.key /etc/ssl/private/
#RUN mv index.html /var/www/html/

ENTRYPOINT ["nginx", "-g", "daemon off;"]

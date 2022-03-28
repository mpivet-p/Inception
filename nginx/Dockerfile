FROM debian:buster

RUN apt update\
    && apt install nginx -y\
    && rm -rf /var/lib/apt/lists/*

#Dev
RUN apt update && apt install vim -y

#RUN mkdir -p /etc/ssl/private

WORKDIR /etc/nginx
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
RUN rm -rf sites*\
        modules*\
        koi-utf\
        koi-win\
        win-utf\
        snippets\
        uwsgi_params\
        scgi_params\
        proxy_params

ENTRYPOINT ["nginx", "-g", "daemon off"]

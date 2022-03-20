FROM debian:buster

RUN apt update\
    && apt install nginx -y\
    && rm -rf /var/lib/apt/lists/*

#Dev
RUN apt update && apt install vim -y

#RUN mkdir -p /etc/ssl/private


WORKDIR /etc/nginx
#COPY ./conf/nginx.conf /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
COPY ./conf/wordpress.conf sites-available/default 
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
#RUN rm -rf sites*\
#        modules*\
#        koi-utf\
#        koi-win\
#        win-utf\
#        snippets\
#        uwsgi_params\
#        scgi_params\
#        proxy_params
RUN sed '/worker_processes/s/auto/1/' -i  /etc/nginx/nginx.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]

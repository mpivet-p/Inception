FROM debian:buster

RUN apt update && apt install nginx -y

WORKDIR /etc/nginx
RUN rm -rf ./*
COPY ./conf/ .


EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]

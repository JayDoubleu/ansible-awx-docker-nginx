FROM ubuntu:16.04
ENV SSL_PATH /etc/ssl
ENV CERT_STRING "/C=UK/ST=Location/L=Location/O=Org/OU=OU/CN=example.com"
RUN apt-get update
RUN apt-get dist-upgrade -y
RUN apt-get install nginx openssl -y
RUN mkdir -p $SSL_PATH
RUN openssl req -x509 -nodes -days 11499 -newkey rsa:2048 -keyout $SSL_PATH/ssl.key -out $SSL_PATH/ssl.crt -subj "$CERT_STRING"
ADD awx_nginx.conf /etc/nginx/conf.d/awx_nginx.conf 

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]

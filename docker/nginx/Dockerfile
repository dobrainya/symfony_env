FROM nginx:latest

WORKDIR /etc/nginx/conf.d

COPY hosts.local.conf .

WORKDIR /var/www/html

CMD ["nginx", "-g", "daemon off;"]

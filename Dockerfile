FROM ubuntu
RUN apt-get update
RUN apt install apache2 -y
ADD index.html /var/www/html/
COPY index.html /var/www/html/
COPY images/ /var/www/html/images/
ENTRYPOINT apachectl -D FOREGROUND


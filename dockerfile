FROM hitalos/laravel
MAINTAINER Mohamed El Kawakibi <melkawakibi@gmail.com>

RUN git config --system http.sslverify false

RUN git clone https://3d83126eb5063901a5ac82ab3c3a51c05b3b1689@github.com/melkawakibi/blogandportfolio.git /var/www

RUN git checkout test

COPY containers/.env /var/www/.env

# Run Compser Install
RUN composer install -d /var/www
RUN php /var/www/artisan key:generate

WORKDIR /var/www

CMD php /var/www/artisan serve --port=80 --host=0.0.0.0
EXPOSE 80
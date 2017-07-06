FROM hitalos/laravel
MAINTAINER Mohamed El Kawakibi <melkawakibi@gmail.com>

RUN git config --system http.sslverify false

RUN git clone https://40bab86c0cb9f45ae8c4d97525cdd947dae9d93a@github.com/melkawakibi/blogandportfolio.git /var/www

RUN cp .env.production .env

# Run Compser Install
RUN composer install -d /var/www
RUN php /var/www/artisan key:generate

WORKDIR /var/www

CMD php /var/www/artisan serve --port=80 --host=0.0.0.0
EXPOSE 80
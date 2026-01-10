FROM php:8.4-fpm-alpine

WORKDIR /app
COPY . .

RUN composer install
RUN composer require laravel/octane
COPY .envDev .env
RUN mkdir -p /app/storage/logs

RUN php artisan octane:install --server="swoole"

CMD php artisan octane:start --server="swoole" --host="0.0.0.0"
EXPOSE 8080

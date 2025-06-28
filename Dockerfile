FROM php:8.1-cli

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y unzip git \
    && curl -sS https://getcomposer.org/installer | php \
    && php composer.phar install

CMD ["php", "-S", "0.0.0.0:8000"]

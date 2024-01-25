#!/bin/sh

composer install --no-cache --prefer-dist --no-autoloader --no-scripts --no-progress

php bin/console cache:clear
php bin/console doctrine:migrations:migrate --query-time --allow-no-migration --all-or-nothing --no-interaction

php-fpm
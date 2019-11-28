FROM php:7.3-alpine

LABEL "com.github.actions.name"="OSKAR-phpstan"
LABEL "com.github.actions.description"="phpstan"
LABEL "com.github.actions.icon"="check"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="http://github.com/oskarstark/phpstan-ga"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="Oskar Stark <oskarstark@googlemail.com>"

COPY --from=composer:1.9.1 /usr/bin/composer /usr/local/bin/composer

RUN mkdir /composer
ENV COMPOSER_HOME=/composer

RUN echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/memory-limit.ini

RUN composer global require phpstan/phpstan ^0.11.19 \
    && composer global require phpstan/phpstan-doctrine \
    && composer global require phpstan/phpstan-phpunit \
    && composer global require phpstan/phpstan-nette \
    && composer global require phpstan/phpstan-symfony \
    && composer global require phpstan/phpstan-mockery \
    && composer global require phpstan/phpstan-webmozart-assert \
    && composer global show | grep phpstan

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

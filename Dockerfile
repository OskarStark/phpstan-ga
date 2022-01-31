FROM php:8.0-alpine

LABEL "com.github.actions.name"="ukkocom-phpstan"
LABEL "com.github.actions.description"="phpstan"
LABEL "com.github.actions.icon"="check"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="http://github.com/SPLCompanyOy/phpstan-ga"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="Matias Mäki <matias.maki@ukko.fi>"

COPY --from=composer:2.2.4 /usr/bin/composer /usr/local/bin/composer

RUN mkdir /composer
ENV COMPOSER_HOME=/composer

RUN echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/memory-limit.ini

ENV VERSION=1.7.15

RUN composer global require phpstan/phpstan $VERSION \
    && composer global require phpstan/extension-installer \
    && composer global require phpstan/phpstan-doctrine \
    && composer global require phpstan/phpstan-phpunit \
    && composer global require phpstan/phpstan-nette \
    && composer global require phpstan/phpstan-symfony \
    && composer global require phpstan/phpstan-mockery \
    && composer global require phpstan/phpstan-webmozart-assert \
    && composer global show "*phpstan*"

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

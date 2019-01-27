#!/bin/sh -l

=======
if [[ ! -z "$PHP_EXTENSIONS" ]]; then
  echo "installing $PHP_EXTENSIONS"
  apk add -q --no-cache $PHP_EXTENSIONS;
  rm -rf /var/cache/apk/*;
fi

if [[ ! -z "$COMPOSER_PACKAGES" ]]; then
   echo "installing $COMPOSER_PACKAGES"
   composer global require --quiet $COMPOSER_PACKAGES;
fi

sh -c "composer install --no-scripts --no-progress && /composer/vendor/bin/phpstan $*"

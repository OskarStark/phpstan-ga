#!/bin/sh -l

sh -c "composer install --no-scripts --no-progress --quiet --no-dev && /composer/vendor/bin/phpstan $*"

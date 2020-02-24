#!/bin/sh -l

sh -c "composer install --no-scripts --no-progress --quiet && /composer/vendor/bin/phpstan $*"

#!/bin/sh -l

NO_DEV="--no-dev"
if [ "$REQUIRE_DEV" = "true" ]; then
    NO_DEV=""
fi

composer install --no-scripts --no-progress --quiet $NO_DEV
/composer/vendor/bin/phpstan $*

#!/bin/sh -l

/composer/vendor/bin/phpstan --version

NO_DEV="--no-dev"
if [ "$REQUIRE_DEV" = "true" ]; then
    NO_DEV=""
fi
COMPOSER_COMMAND="composer install --no-scripts --no-progress $NO_DEV"
echo "::group::$COMPOSER_COMMAND"
$COMPOSER_COMMAND
echo "::endgroup::"
/composer/vendor/bin/phpstan $*

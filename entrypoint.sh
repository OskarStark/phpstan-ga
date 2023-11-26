#!/bin/sh -l

set -e

/composer/vendor/bin/phpstan --version

echo "::group::Installed PHPStan extensions"
composer show "*phpstan*"
echo "::endgroup::"

IGNORE_PLATFORM_REQS=""
if [ "$CHECK_PLATFORM_REQUIREMENTS" = "false" ]; then
    IGNORE_PLATFORM_REQS="--ignore-platform-reqs"
fi

NO_DEV="--no-dev"
if [ "$REQUIRE_DEV" = "true" ]; then
    NO_DEV=""
fi

if [ -z "$PRE_COMPOSER_COMMANDS" ]; then
    for str in ${PRE_COMPOSER_COMMANDS[@]}; do
        eval "$str"
    done
fi

COMPOSER_COMMAND="composer install --no-progress $NO_DEV $IGNORE_PLATFORM_REQS"
echo "::group::$COMPOSER_COMMAND"

if [ -z "$POST_COMPOSER_COMMANDS" ]; then
    for str in ${POST_COMPOSER_COMMANDS[@]}; do
        eval "$str"
    done
fi

$COMPOSER_COMMAND
echo "::endgroup::"
/composer/vendor/bin/phpstan $*

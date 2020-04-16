# GithubAction for PHPStan

## Usage

You can use it as a Github Action like this:

_.github/workflows/test.yml_
```
on: [push, pull_request]
name: Test
jobs:
  phpstan:
    name: PHPStan
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: PHPStan
      uses: docker://oskarstark/phpstan-ga
      with:
        args: analyse src/
```

_to use a specific level:_
```diff
on: [push, pull_request]
name: Test
jobs:
  phpstan:
    name: PHPStan
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: PHPStan
      uses: docker://oskarstark/phpstan-ga
      with:
-        args: analyse src/
+        args: analyse src/ --level=5
```

_to install dev dependencies:_
```diff
on: [push, pull_request]
name: Test
jobs:
  phpstan:
    name: PHPStan
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: PHPStan
      uses: docker://oskarstark/phpstan-ga
+     env:
+       REQUIRE_DEV: true
      with:
        args: analyse src/
```

_to skip checking the platfrom requirements:_
```diff
on: [push, pull_request]
name: Test
jobs:
  phpstan:
    name: PHPStan
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: PHPStan
      uses: docker://oskarstark/phpstan-ga
+     env:
+        CHECK_PLATFORM_REQUIREMENTS: false
      with:
        args: analyse src/
```

_to use a phpstan.neon.dist configuration file:_

just drop the `phpstan.neon.dist` in your repository root and it will be taken into account.


**You can copy/paste the .github folder (under examples/) to your project and thats all!**

## Docker

A Docker-Image is built automatically and located here:
https://hub.docker.com/r/oskarstark/phpstan-ga

You can run it in any given directory like this:

`docker run --rm -it -w=/app -v ${PWD}:/app oskarstark/phpstan-ga:latest analyse src/ --level=5`


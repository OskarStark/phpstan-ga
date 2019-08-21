# GithubAction for PHPStan

## Usage

You can use it as a Github Action like this:

_.github/workflows/push.yml_
```
on: push
name: Main
jobs:
  phpstan:
    name: PHPStan
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: PHPStan
      uses: docker://oskarstark/phpstan-ga
```

_to use a specific level:_
```diff
on: push
name: Main
jobs:
  phpstan:
    name: PHPStan
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: PHPStan
      uses: docker://oskarstark/phpstan-ga
+      with:
+        args: analyse src/ --level=5
```

**You can copy/paste the .github folder (under examples/) to your project and thats all!**

## Docker

A Docker-Image is built automatically and located here:
https://hub.docker.com/r/oskarstark/phpstan-ga

You can run it in any given directory like this:

`docker run --rm -it -w=/app -v ${PWD}:/app oskarstark/phpstan-ga:latest analyse src/ --level=5`


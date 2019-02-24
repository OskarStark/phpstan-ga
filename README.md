# GithubAction for PHPStan

## Usage

You can use it as a Github Action like this:

_.github/main.workflow_
```
workflow "Main" {
  on = "push"
  resolves = ["PHPStan"]
}

action "PHPStan" {
  uses = "docker://oskarstark/phpstan-ga"
  args = "analyse src/"
}
```

_to use a specific level:_
```diff
workflow "Main" {
  on = "push"
  resolves = ["PHPStan"]
}

action "PHPStan" {
  uses = "docker://oskarstark/phpstan-ga"
+  args = "analyse src/ --level=5"
}
```

**You can copy/paste the .github folder (under examples/) to your project and thats all!**

## PHPStan plugins
You might want to add extra plugins to phpstan to be more strict. To install them define
`COMPOSER_PACKAGES` as environment variable in your workflow.

**Please note that installing plugins using the environment variable has impact on the execution time. To speed up your workflow push a prepared image to a docker repository**

## Additional Alpine packages
The docker image contains a minimal set of installed php packages. For some projects you
might want to add more php extensions. Define `PHP_EXTENSIONS` as environment variable in
your workflow to do so.

**Please note that installing packages using the environment variable has impact on the execution time. To speed up your workflow push a prepared image to a docker repository**


## Docker

A Docker-Image is built automatically and located here:
https://cloud.docker.com/u/oskarstark/repository/docker/oskarstark/phpstan-ga

You can run it in any given directory like this:

`docker run --rm -it -w=/app -v ${PWD}:/app oskarstark/phpstan-ga:latest analyse src/ --level=5`


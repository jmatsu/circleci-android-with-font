This repository is to build compatible docker images with libraries which use font modules. e.g. [maskarade/gradle-android-ribbonizer-plugin](https://github.com/maskarade/gradle-android-ribbonizer-plugin)

Images are regulary built every day at 12:00am UTC.

ref: https://github.com/circleci/circleci-images

### Motivation

Currently, CircleCI's android images do not work with font modules like java.awt.font due to base jdk images. Therefore, [maskarade/gradle-android-ribbonizer-plugin](https://github.com/maskarade/gradle-android-ribbonizer-plugin) does not work with the current CircleCI images unfortunately.

### How to use

You need to rename a namespace of docker image from `circleci` to `jmatsu`.

*Before*

```
docker:
  image: circleci/android:api-27
```

*After*

```
docker:
  image: jmatsu/android:api-27
```

See https://cloud.docker.com/repository/docker/jmatsu/android/tags for the supported tags.

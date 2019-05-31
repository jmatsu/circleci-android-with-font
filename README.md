Docker images are based on CircleCI's android images but these can use java.awt.font.

For example, https://github.com/maskarade/gradle-android-ribbonizer-plugin works with these images.

ref: https://github.com/circleci/circleci-images

### How to use

You need to rename `circleci` to `jmatsu` of docker image.

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
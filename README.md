# ci-sandbox
My sandbox for experimenting with CI services.

|              | CircleCI                                                                                                       | TravisCI                                                                                                      | Appveyor                                                                                                                              |
|--------------|----------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| Build Status | [![Circle CI](https://circleci.com/gh/jcfr/ci-sandbox.svg?style=svg)](https://circleci.com/gh/jcfr/ci-sandbox) | [![TravisCI](https://travis-ci.org/jcfr/ci-sandbox.svg?branch=master)](https://travis-ci.org/jcfr/ci-sandbox) | [![Appveyor](https://ci.appveyor.com/api/projects/status/81c2532cyie43bhu?svg=true)](https://ci.appveyor.com/project/jcfr/ci-sandbox) |


# Disable all notifications

* Appveyor

```
notifications:
  - provider: Email
    on_build_success: false
    on_build_failure: false
    on_build_status_changed: false
```

* CircleCI

The email notification settings are controlled by the user.

![](https://raw.githubusercontent.com/jcfr/ci-sandbox/master/images/circleci-perproject-email-notification-settings.png)


* TravisCI

```
notifications:
  email: false
```

# Deployment settings

## CircleCI

* Two sections:
  * ``nightly``: associated with ``master`` branch
  * ``release``: associated with a [tag regular expression](https://circleci.com/docs/configuration/#tags): ``/v[0-9]+\.[0-9]+\.[0-9]+/``

  ```
  deployment:
    nightly:
      branch: master
      owner: jcfr
      commands:
        - echo "deployment-nightly"
    release:
      tag: /v[0-9]+\.[0-9]+\.[0-9]+/
      owner: jcfr
      commands:
        - echo "deployment-release"
  ```

  Submission when ``master`` is updated:

  ![](https://raw.githubusercontent.com/jcfr/ci-sandbox/master/images/circleci-deployment-release-nightly-master-updated.png)

  Submission after creating and pushing a tag:

  ```
  git tag -s -m "v0.1.0" v0.1.0
  git push origin v0.1.0
  ```

  works as expected:

  ![](https://raw.githubusercontent.com/jcfr/ci-sandbox/master/images/circleci-deployment-release-nightly-signed-tag-pushed_1.png)

  ![](https://raw.githubusercontent.com/jcfr/ci-sandbox/master/images/circleci-deployment-release-nightly-signed-tag-pushed_2.png)


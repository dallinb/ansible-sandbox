# Ansible Sandbox

[![Build Status](https://travis-ci.org/dallinb/ansible-sandbox.png?branch=master)](https://travis-ci.org/dallinb/ansible-sandbox)

## Introduction

This repository is intended to be a introduction to using kitchen test and
Docker to test Ansible code.

For these steps to work on your local machine, you will need to have
[Docker installed](https://docs.docker.com/engine/installation/).

## Tests and TravisCI

The provided [`Makefile`](./Makefile) provides the following targets:

| Target         | Description                                          |
|----------------|------------------------------------------------------|
|`before_script` | Show the versions of the individual tools installed. |
|`install`       | Install the required tools.                          |
|`script`        | The default action.  Runs the tests.                 |

### Testing Lifecycle

Within [`.kitchen.yml`](./kitchen.yml) under the `suites` section, two suites
are defined.  They are as follows:

* **apply**:  Runs the Ansible playbook twice.  This is because the
  `idempotency_test` flag is set to true.  The first run needs to be applied
  successfully and the second run needs to complete without changing anything
  to prove that the code is idempotent.
* **check**:  Runs the test once with the `ansible_check` set to true.  This
  simply checks that the entire playbook can be executed with the `-C` or
  `--check` flag.

![Activity Diagram](images/activity-diagram.png)

| Command           | Description                                                                                 |
|-------------------|---------------------------------------------------------------------------------------------|
|`kitchen create`   | Builds the Docker container.                                                                |
|`kitchen converge` | Executes the Ansible playbook against the container.                                        |
|`kitchen login`    | Will get you onto the container as the *kitchen* user.  This user has `sudo` access to root.|
|`kitchen verify`   | Runs Serverspec against the container.                                                      |
|`kitchen destroy`  | Stops the container.                                                                        |

### Integration with TravisCI

The file [`.travis.yml`](.travis.yml) configures the project to run on
[TravisCI](https://travis-ci.org/dallinb/ansible-sandbox).  It has been written
to cache the Ruby gems and Python packages to improve performance.  The
Docker image is not cached as this is
[advised against](https://docs.travis-ci.com/user/caching/#Things-not-to-cache)
in the TravisCI documentation.  The build installation and build steps for
Travis are mirrored in the provided
[`Makefile`](Makefile) so to emulate what is ran on the Travis server locally
simply run `make`.

## Useful Links

* [Test Kitchen](http://kitchen.ci/)
* [kitchen-ansible](https://github.com/neillturner/kitchen-ansible/blob/master/README.md)
  * [Provisioner Options for Kitchen Ansible](https://github.com/neillturner/kitchen-ansible/blob/master/provisioner_options.md)
* [kitchen-docker](https://github.com/test-kitchen/kitchen-docker)
* [Serverspec: Resource Types](http://serverspec.org/resource_types.html)
